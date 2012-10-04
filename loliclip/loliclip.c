#include <ctype.h>
#include <errno.h>
#include <libgen.h>
#include <limits.h>
#include <pwd.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <stdarg.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>
#include <zlib.h>
#include <xcb/xcb.h>

#ifdef XCB_UTIL
#  include <xcb/xcb_util.h>
#endif

#define MIN(a, b) (((a) < (b)) ? (a) : (b))
#define LENGTH(x) (sizeof(x)/sizeof(*x))
#define XCB_EVENT_RESPONSE_TYPE_MASK   (0x7f)
#define XCB_EVENT_RESPONSE_TYPE(e)     (e->response_type & XCB_EVENT_RESPONSE_TYPE_MASK)
#define STRNCMP(x,y) strncmp(x,y,strlen(y))

/* WARNING:
 * If you came here to learn how X clipboard works, then you have come to wrong place.
 * Seriously, I'm amazed that any of this code even does anything.
 */

/* atom index */
enum {
   XSEL_DATA,
   ATOM,
   INTEGER,

   UTF8_STRING,
   TIMESTAMP,
   TEXT,
   STRING,
   //COMPOUND_TEXT
   INCR,
   //MULTIPLE,
   TARGETS
};

/* atom names */
const char *natoms[] = {
   "XSEL_DATA",
   "ATOM",
   "INTEGER"
};

/* normal selection names */
const char *textsel[] = {
   "UTF8_STRING",
   "TIMESTAMP",
   "TEXT",
   "STRING",
   //"COMPOUND_TEXT",
   "INCR",
   //"MULTIPLE",
   "TARGETS"
};

/* actual atoms stored here */
static xcb_atom_t atoms[LENGTH(natoms)+LENGTH(textsel)];

/* special clipboards */
typedef struct specialclip {
   const char *name;
   unsigned int share_binary;
   unsigned int dont_set;
   xcb_atom_t sel;
   size_t size;
   void *data;
   struct specialclip *sclip;
} specialclip;

/* clipboard data struct */
typedef struct clipdata  {
   const char *name;
   const char *sync;
   xcb_atom_t sel;
   xcb_atom_t *targets;
   unsigned int num_targets;
   unsigned int cycle_target;
   unsigned int maxclips;
   unsigned int flags;
   unsigned int cflags;
   unsigned int hash, ohash;
   size_t size;
   void *data;
   char selected;
   char has_special;
   char should_own;
   unsigned int is_waiting;
   xcb_window_t owner;
} clipdata;

/* clipboard command sequences */
typedef struct cmdseq {
   const char *cmd;
   unsigned int flag;
} cmdseq;

/* helper macros for registering clipboards */
#define REGISTER_CLIPBOARD(clipboard_to_handle, clipboard_to_sync, maxclips, flags) \
   { clipboard_to_handle, clipboard_to_sync, XCB_NONE, NULL, 0, 0, maxclips, flags, 0, 0, 0, 0, NULL, 0, 0, 0, 0, XCB_NONE }

/* register special selections */
#define REGISTER_SELECTION(name, share_binary) \
   { name, share_binary, 0, XCB_NONE, 0, NULL, NULL }

/* shared binary selection */
specialclip bclip = REGISTER_SELECTION("BINARY DATA", 0);

/* load configuration */
#include "config.h"

/* undef */
#undef REGISTER_CLIPBOARD
#undef REGISTER_SELECTION

/* supported atoms stored here */
static xcb_atom_t satoms[LENGTH(textsel)+LENGTH(sclip)];

/* argument stuff */
typedef int (*argfunc)(int argc, char **argv);
typedef struct cliparg {
   int atarg;
   const char arg;
   const char *full;
   char argc;
   argfunc func;
   argfunc lonefunc;
   const char *desc;
} cliparg;

#define REGISTER_ARG(x) static int x(int argc, char **argv)
REGISTER_ARG(arg_daemon);
REGISTER_ARG(arg_primary);
REGISTER_ARG(arg_primary_sync);
REGISTER_ARG(arg_secondary);
REGISTER_ARG(arg_secondary_sync);
REGISTER_ARG(arg_clipboard);
REGISTER_ARG(arg_clipboard_sync);
REGISTER_ARG(arg_get);
REGISTER_ARG(arg_list);
REGISTER_ARG(arg_dmenu);
REGISTER_ARG(arg_clear);
REGISTER_ARG(arg_query);
REGISTER_ARG(arg_binary);
REGISTER_ARG(arg_wait);
#undef REGISTER_ARG

/* arguments are executed in order */
static cliparg clipargs[] = {
   { 0, 'd', "daemon",     0, arg_daemon,    NULL,                "Run as daemon." },
   { 0, 'w', "wait",       0, arg_wait,      arg_wait,            "\tWait until selection is taken." },
   { 0, 'p', "primary",    0, arg_primary,   arg_primary_sync,    "Operate on PRIMARY." },
   { 0, 's', "secondary",  0, arg_secondary, arg_secondary_sync,  "Operate on SECONDARY." },
   { 0, 'c', "clipboard",  0, arg_clipboard, arg_clipboard_sync,  "Operate on CLIPBOARD." },
   { 0, 'g', "get",        0, arg_get,       NULL,                "\tGet clip by index or hash form history." },
   { 0, 'l', "list",       0, arg_list,      NULL,                "\tLists clips from history." },
   { 0, 'm', "dmenu",      0, arg_dmenu,     NULL,                "\tDmenu friendly listing." },
   { 0, 'C', "clear",      0, arg_clear,     NULL,                "\tClears clipboard history." },
   { 0, 'q', "query",      0, arg_query,     NULL,                "\tQuery if loliclip daemon is running." },
   { 0, 'b', "binary",     1, arg_binary,    NULL,                "Get binary data from clipboard." }
};

/* xcb connection */
static xcb_connection_t *xcb;

/* hidden window */
static xcb_window_t xcbw;

/* xcb screen */
static xcb_screen_t *xcb_screen;

/* timeout to xcb loop blocking, when we don't
 * own all the clipboards. */
static int xcb_timeout_loop = 25000 * 25;

/* timeout to get xsel calls */
static int xcb_timeout_xsel_s  = 0;
static int xcb_timeout_xsel_ns = 0;

/* timeout to incr retival */
static int xcb_timeout_incr = 2;

/* timeout to xcb wait calls from command line */
static int xcb_timeout_cli = 1;        /* in seconds */
static int xcb_timeout_daemon = 5000;  /* in nanoseconds */

/* X timestamp of first request */
static xcb_time_t xcb_timestamp = 0;

/* wait mode? */
char WAIT_MODE = 0;

/* output helpers */
#define _D "\1-\2!\1-\5"
#define ERR_SNTX _D" \3%d \2[\4%s \5:: \4%s\2]\5:"
#ifndef NDEBUG
#define OUT(x,...) \
      _prnt(stderr, _D" "x, ##__VA_ARGS__);
#else
#define OUT(x,...) ;
#endif
#define ERR(x,...) \
      _prnt(stderr, ERR_SNTX" "x, __LINE__, __FILE__, __func__, ##__VA_ARGS__);
#define MEMERR() ERR("Out of memory, buy more ram.");

/* colors */
static const char *colors[] = {
   "\33[31m", /* red */
   "\33[32m", /* green */
   "\33[34m", /* blue */
   "\33[33m", /* yellow */
   "\33[37m", /* white */
   "\33[0m",  /* normal */
};

/* common functions */
static int set_clipboard_own(clipdata *c);
static void handle_notify(xcb_selection_notify_event_t* ev);

/* colored print */
static void _cprnt(FILE *out, char *buffer) {
   size_t i, len = strlen(buffer);
   for (i = 0; i != len; ++i) {
           if (buffer[i] == '\1') fprintf(out, "%s", colors[0]);
      else if (buffer[i] == '\2') fprintf(out, "%s", colors[1]);
      else if (buffer[i] == '\3') fprintf(out, "%s", colors[2]);
      else if (buffer[i] == '\4') fprintf(out, "%s", colors[3]);
      else if (buffer[i] == '\5') fprintf(out, "%s", colors[4]);
      else fprintf(out, "%c", buffer[i]);
   }
   fprintf(out, "%s\n", colors[5]);
   fflush(out);
}

/* printf wrapper */
static void _prnt(FILE *out, const char *fmt, ...) {
   va_list args;
   char buffer[LINE_MAX];

   memset(buffer, 0, LINE_MAX);
   va_start(args, fmt);
   vsnprintf(buffer, LINE_MAX-1, fmt, args);
   va_end(args);
   _cprnt(out, buffer);
}

/* zlib stuff */
#define ZCHUNK 16384

/* compress source to destination */
static int zcompress(FILE *s, FILE *d) {
   int ret, flush; unsigned have; z_stream strm;
   unsigned char in[ZCHUNK], out[ZCHUNK];

   /* allocate deflate state */
   strm.zalloc = Z_NULL;
   strm.zfree  = Z_NULL;
   strm.opaque = Z_NULL;
   ret = deflateInit(&strm, ZLIB_LEVEL);
   if (ret != Z_OK)
      return ret;

   /* compress until end of file */
   do {
      strm.avail_in = fread(in, 1, ZCHUNK, s);
      if (ferror(s)) {
         (void)deflateEnd(&strm);
         return Z_ERRNO;
      }
      flush = feof(s) ? Z_FINISH : Z_NO_FLUSH;
      strm.next_in = in;

      /* run deflate() on input until output buffer not full, finish
         compression if all of source has been read in */
      do {
         strm.avail_out = ZCHUNK;
         strm.next_out  = out;
         ret = deflate(&strm, flush);    /* no bad return value */
         if (ret == Z_STREAM_ERROR) goto state_fail;
         have = ZCHUNK - strm.avail_out;
         if (fwrite(out, 1, have, d) != have || ferror(d)) {
            (void)deflateEnd(&strm);
            return Z_ERRNO;
         }
      } while (strm.avail_out == 0);
      if (strm.avail_in != 0) goto state_fail;

      /* done when last data in file processed */
   } while (flush != Z_FINISH);
   if (ret != Z_STREAM_END) goto state_fail;

   /* clean up and return */
   (void)deflateEnd(&strm);
   return Z_OK;

state_fail:
   ERR("zlib state clobbered");
   return Z_ERRNO;
}

/* decomress source to destination */
int zdecompress(FILE *s, FILE *d) {
   int ret; unsigned have; z_stream strm;
   unsigned char in[ZCHUNK], out[ZCHUNK];

   /* allocate inflate state */
   strm.zalloc   = Z_NULL;
   strm.zfree    = Z_NULL;
   strm.opaque   = Z_NULL;
   strm.avail_in = 0;
   strm.next_in  = Z_NULL;
   ret = inflateInit(&strm);
   if (ret != Z_OK)
      return ret;

   /* decompress until deflate stream ends or end of file */
   do {
      strm.avail_in = fread(in, 1, ZCHUNK, s);
      if (ferror(s)) {
         (void)inflateEnd(&strm);
         return Z_ERRNO;
      }
      if (strm.avail_in == 0)
         break;
      strm.next_in = in;

      /* run inflate() on input until output buffer not full */
      do {
         strm.avail_out = ZCHUNK;
         strm.next_out = out;
         ret = inflate(&strm, Z_NO_FLUSH);
         if (ret == Z_STREAM_ERROR) goto state_fail;
         switch (ret) {
            case Z_NEED_DICT:
               ret = Z_DATA_ERROR;     /* and fall through */
            case Z_DATA_ERROR:
            case Z_MEM_ERROR:
               (void)inflateEnd(&strm);
               return ret;
         }
         have = ZCHUNK - strm.avail_out;
         if (fwrite(out, 1, have, d) != have || ferror(d)) {
            (void)inflateEnd(&strm);
            return Z_ERRNO;
         }
      } while (strm.avail_out == 0);

      /* done when inflate() says it's done */
   } while (ret != Z_STREAM_END);

   /* clean up and return */
   (void)inflateEnd(&strm);
   return ret == Z_STREAM_END ? Z_OK : Z_DATA_ERROR;

state_fail:
   ERR("zlib state clobbered");
   return Z_ERRNO;
}

/* trim trailing and leading whitespace */
static char* trim_whitespace(char *buffer, size_t len, size_t *nlen) {
   char *s =buffer; size_t lead = 0, trail = 0, hasnl = 0; *nlen = 0;
   char *nbuffer = NULL;
   for (; *s && isspace(*s); ++s) ++lead;
   if (!*s) return NULL;

   for (s = buffer+len-1; len && (isspace(*s) || *s == '\n'); --s, --len)
      if (*s == '\n') hasnl = trail; else ++trail;

   if (len<=trail+lead)
      return NULL;

   *nlen = len-trail-lead+(hasnl?1:0)+1;
   if (!(nbuffer = malloc(*nlen+1)))
      return NULL;
   memcpy(nbuffer, buffer+lead, *nlen);
   if (hasnl) nbuffer[*nlen-1] = '\n';
   nbuffer[*nlen] = 0;
   return nbuffer;
}

/* is data multiline? */
static int isml(char *buffer, size_t len) {
   size_t i; char ml = 0;
   for (i = 0; i != len; ++i) {
      if (ml && (buffer[i] != '\n' && !isspace(buffer[i])))
         return 1;
      if (buffer[i] == '\n') ml = 1;
   }
   return 0;
}

/* is data binary? */
static int isbinary(char *buffer, size_t len) {
   size_t i;
   for (i = 0; i != len && buffer[i] != 0; ++i);
   //OUT("BINARY: %zu/%zu", i, len);
   return i<len;
}

/* assign new special selection data */
static int set_special_selection_data(specialclip *s, void *buffer, size_t len) {
   if (!buffer || !len || s->dont_set) return 0;

   if (!s->share_binary) {
      if (s->data) free(s->data);
      s->data = buffer;
      s->size = len;
   } else {
      if (bclip.dont_set) return 0;
      if (bclip.data) {
         bclip.sclip->data = NULL;
         bclip.sclip->size = 0;
         free(bclip.data);
      }
      s->data = bclip.data = buffer;
      s->size = bclip.size = len;
      bclip.sclip = s;
   }

   return 1;
}

/* assign new clipboard data
 * return 1 == success
 * return 0 == fail */
static int set_clipboard_data(clipdata *c, void *buffer, size_t len) {
   char *s, *copy = NULL; size_t nlen, i;
   unsigned int flags = 0;

   if (!buffer || !len) return 0;

   /* don't process binary */
   if (isbinary(buffer, len)) {
      OUT("Binary data! [%zu]", len);
      if (!(copy = malloc(len+1)))
         goto fail;
      memcpy(copy, buffer, len); copy[len] = 0;
      if (c->data) free(c->data);
      c->data = copy; c->size = len;
      c->cflags = CLIP_SKIP_HISTORY;
      return 1;
   }

   /* do modification in s */
   s = buffer;

   /* begin command sequence */
   if (!STRNCMP(s, LOLICLIP_CMD_SEQ)) {
      len -= strlen(LOLICLIP_CMD_SEQ);
      for (i = 0, s += strlen(LOLICLIP_CMD_SEQ); i != LENGTH(cmdseqs); ++i) {
         if (!STRNCMP(s, cmdseqs[i].cmd)) {
            flags |= cmdseqs[i].flag;
            len   -= strlen(cmdseqs[i].cmd);
            s     += strlen(cmdseqs[i].cmd);
            OUT("FOUND CMD %s", cmdseqs[i].cmd);
         }
      }
   }

   if (c->flags & CLIPBOARD_TRIM_WHITESPACE ||
      (c->flags & CLIPBOARD_TRIM_WHITESPACE_NO_MULTILINE && !isml(buffer, len))) {
      if (!(copy = trim_whitespace(s, len, &nlen)) || !nlen)
         goto fail; /* prop empty after trimming */
      len = nlen;
   }

   if (!copy) {
      if (!len || !(copy = malloc(len+1)))
         goto fail;
      memcpy(copy, s, len); copy[len] = 0;
   }

   if (c->flags & CLIPBOARD_TRIM_TRAILING_NEWLINE) {
      for (s = copy+len-1; len && *s == '\n'; --s) {
         --len; *s = 0;
      }
      if (!len || !*copy) goto fail;
   }

   if (c->data) free(c->data);
   c->data = copy; c->size = len; c->cflags = flags;
   return 1;

fail:
   if (copy) free(copy);
   return 0;
}

/* get database path for clipboard */
static char* get_clipboard_database_path(clipdata *c, char create) {
   const char *xdg_data, *home, *programdir, *clipfile, *ext;
   struct passwd *pw = NULL; char *buffer = NULL, *dir, *dirc = NULL;
   size_t len;

   if (!(xdg_data = getenv("XDG_DATA_HOME"))) {
      xdg_data = ".local";

      if (!(home = getenv("HOME")) || !(pw = getpwuid(getuid())))
         goto no_home;

      if (pw && pw->pw_dir) home = pw->pw_dir;
      else if (pw) goto no_home;
   } else home = NULL;

   ext        = "z";
   programdir = "loliclip";
   clipfile   = c->name;
   if (!clipfile) goto unknown_clip;

   len = (home?strlen(home)+1:0)+
         strlen(xdg_data)+1+
         strlen(programdir)+1+
         strlen(clipfile)+1+
         strlen(ext)+1;

   if (!(buffer = malloc(len)))
      goto out_of_memory;

   snprintf(buffer, len, "%s%s%s/%s/%s.%s",
         home?home:"", home?"/":"", xdg_data, programdir, clipfile, ext);

   dirc = strdup(buffer);
   dir  = dirname(dirc);

   if (access(dir, F_OK) != 0) {
      if (errno == EACCES) goto access_fail;
      else if (create) {
         if (mkdir(dir, S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1)
            goto mkdir_fail;
      } else goto fail; /* silent fail */
   }

   free(dirc);
   return buffer;

no_home:
   ERR("Could not find home directory.");
   goto fail;
unknown_clip:
   ERR("Unknown clipboard, will not get path.");
   goto fail;
out_of_memory:
   MEMERR();
   goto fail;
access_fail:
   ERR("(EACCES) Could not access path: %s", dir);
   goto fail;
mkdir_fail:
   ERR("Failed to create path: %s", dir);
fail:
   if (buffer) free(buffer);
   if (dirc)   free(dirc);
   return NULL;
}

/* dmenu puts callback for ls */
static int dmenu_puts(void *calldata, clipdata *c,
      const char *buffer, size_t blen, size_t rlen, size_t size,
      unsigned int hash, unsigned int index) {
   size_t i, limit; char ws = 0;
   if (rlen) return 1; limit = (blen>DMENU_LIMIT?DMENU_LIMIT:blen);
   printf("%4d: ", index);
   for (i = 0; i != limit; ++i) {
      if (ws && buffer[i]==' ') continue; ws = 0;
      printf("%c", (buffer[i]=='\n'||buffer[i]=='\r')?' ':buffer[i]);
      ws = (buffer[i]==' '||buffer[i]=='\n'||buffer[i]=='\r')?1:0;
   }
   printf("%s%s\n", ws?"":" ", blen>DMENU_LIMIT?"...":"");
   return 1;
}

/* puts callback for ls */
static int ls_puts(void *calldata, clipdata *c,
      const char *buffer, size_t blen, size_t rlen, size_t size,
      unsigned int hash, unsigned int index) {
   size_t i;
   for (i = 0; i != blen; ++i)
      printf("%c", buffer[i]);
   if (rlen+blen == size) puts("");
   return 1;
}

/* get callback for ls */
static int ls_get(void *calldata, clipdata *c,
      const char *buffer, size_t blen, size_t rlen, size_t size,
      unsigned int hash, unsigned int index) {
   unsigned int arg = *(unsigned int*)calldata;
   if (index != arg && hash != arg) return 1;
   return ls_puts(calldata, c, buffer, blen, rlen, size, hash, index);
}

/* restore clipboard data */
static int restore_clipboard(void *calldata, clipdata *c,
      const char *buffer, size_t blen, size_t rlen, size_t size,
      unsigned int hash, unsigned int index) {
   static char *cbuf = NULL;
   static size_t lastsize = 0;
   unsigned int rindex;

   /* check if terrible things have happened */
   if (!lastsize || lastsize != size) {
      lastsize = size;
      if (cbuf) free(cbuf);
      cbuf = NULL;
   }

   /* create buffer */
   if (!cbuf && !(cbuf = malloc(size)))
      return 0;

   /* copy data */
   memcpy(cbuf+rlen, buffer, blen);

   if (rlen+blen != size) return 1;

   rindex = *(unsigned int*)calldata;
   if (rindex != index)
      return 1;

   OUT("\4Restoring selection");
   set_clipboard_data(c, cbuf, size);
   free(cbuf); cbuf = NULL;
   return 0;
}

/* callback typedef */
typedef int (*lscallback)(void *calldata, clipdata *c,
      const char *buffer, size_t blen, size_t rlen, size_t size,
      unsigned int hash, unsigned int index);

/* list clipboard data */
static int ls_clipboard(clipdata *c, char *path, void *calldata, lscallback callback) {
   FILE *f = NULL, *z = NULL; size_t read, size, toread, read2, len;
   unsigned int hash, clips = 0; char buffer[1024], *zpath = NULL, *ext;

   if (USE_ZLIB) {
      ext = "dez";
      len = strlen(path)+1+strlen(ext)+1;
      if (!(zpath = malloc(len)))
         goto out_of_memory;
      snprintf(zpath, len, "%s.%s", path, ext);

      if (!(f = fopen(path, "rb")) || !(z = fopen(zpath, "w+b")))
         goto fail;
      if (zdecompress(f, z) != Z_OK)
         goto zlib_fail;
      fclose(f); f = z; z = NULL; /* swap */
      fseek(f, 0L, SEEK_SET);
   }

   if (!f && !(f = fopen(path, "rb")))
      goto read_fail;

   while ((read = fread(&hash, sizeof(unsigned int), 1, f))) {
      read2  = 0; fread(&size, sizeof(size_t), 1, f);
      toread = (sizeof(buffer)>size)?size:sizeof(buffer);
      while ((read = fread(buffer, 1, toread, f)) && read <= size) {
         if (!callback(calldata, c, buffer, read, read2, size, hash, clips))
            goto fail;
         read2 += read;
         toread = (size-read2<sizeof(buffer))?size-read2:sizeof(buffer);
      }
      fread(buffer, 1, 1, f);
      ++clips;
   }

   fclose(f);
   if (zpath) {
      remove(zpath);
      free(zpath);
   }
   return 1;

out_of_memory:
   MEMERR();
   goto fail;
read_fail:
   ERR("Failed to open %s for reading.", path);
   goto fail;
zlib_fail:
   ERR("zlib compresison/decompression failed.");
fail:
   if (f) fclose(f);
   if (z) fclose(z);
   if (z && zpath) remove(zpath);
   if (zpath) free(zpath);
   return 0;
}

/* store selection to database */
static void store_clip(clipdata *c) {
   char *path = NULL, *tmp = NULL, *zpath = NULL, *ext;
   FILE *f = NULL, *t = NULL, *z = NULL; char buffer[1024];
   size_t len, read, size, toread, read2;
   unsigned int hash, clips = 0;

   if (!(path = get_clipboard_database_path(c, 1)))
      goto fail;

   ext = "tmp";
   len = strlen(path)+1+strlen(ext)+1;
   if (!(tmp = malloc(len)))
      goto out_of_memory;
   snprintf(tmp, len, "%s.%s", path, ext);

   if (USE_ZLIB) {
      ext = "dez";
      len = strlen(path)+1+strlen(ext)+1;
      if (!(zpath = malloc(len)))
         goto out_of_memory;
      snprintf(zpath, len, "%s.%s", path, ext);
   }

   OUT("\2Storing to \4%s\5\n%s", c->name, (char*)c->data);
#if 0
#ifndef NDEBUG
   for (i = 0; i != c->size; ++i)
      printf("%d", ((char*)c->data)[i]);
   puts("");
#endif
#endif
   OUT("\2hash:  \5%u", c->hash);
   OUT("\2size:  \5%zu", c->size);
   OUT("\2db:    \5%s", path);
   OUT("\2tmp:   \5%s", tmp);
   if (USE_ZLIB) OUT("\2zde:   \5%s", zpath);

   if (!(t = fopen(tmp, (USE_ZLIB)?"w+b":"wb")))
      goto tmp_fail;

   fwrite(&c->hash, sizeof(unsigned int), 1, t);
   fwrite(&c->size, sizeof(size_t), 1, t);
   fwrite(c->data, 1, c->size, t);
   fwrite("\n", 1, 1, t);

   if (USE_ZLIB && (f = fopen(path, "rb"))) {
      if (!(z = fopen(zpath, "w+b"))) goto ddb_fail;
      if (zdecompress(f, z) != Z_OK)
         goto zlib_fail;
      fclose(f); f = z; z = NULL; /* swap */
      fseek(f, 0L, SEEK_SET);
   }

   if (f || (f = fopen(path, "rb"))) {
      while ((read = fread(&hash, sizeof(unsigned int), 1, f))) {
         if (hash != c->hash && ++clips >= c->maxclips) break;
         fread(&size, sizeof(size_t), 1, f); read2 = 0;
         if (hash != c->hash) {
            fwrite(&hash, sizeof(unsigned int), 1, t);
            fwrite(&size, sizeof(size_t), 1, t);
         }
         toread = (sizeof(buffer)>size)?size:sizeof(buffer);
         while ((read = fread(buffer, 1, toread, f)) && read <= size) {
            if (hash != c->hash) fwrite(buffer, 1, read, t); read2 += read;
            toread = (size-read2<sizeof(buffer))?size-read2:sizeof(buffer);
         }
         fread(buffer, 1, 1, f);
         if (hash != c->hash) fwrite(buffer, 1, 1, t);
      }
      fclose(f);
   }

   if (USE_ZLIB) {
      remove(zpath);
      if (!(f = fopen(path, "wb")))
         goto cdb_fail;
      fseek(t, 0L, SEEK_SET);
      if (zcompress(t, f) != Z_OK)
         goto zlib_fail;
      fclose(t); fclose(f);
      remove(tmp);
   } else {
      remove(path); fclose(t);
      rename(tmp, path);
   }

   OUT("\2STORED!");
   free(path);
   free(tmp);
   free(zpath);
   return;
out_of_memory:
   MEMERR();
   goto fail;
tmp_fail:
   ERR("Failed to open %s for writing.", tmp);
   goto fail;
cdb_fail:
   ERR("Failed to open %s for compression.", path);
   goto fail;
ddb_fail:
   ERR("Failed to open %s for decompression.", zpath);
   goto fail;
zlib_fail:
   ERR("zlib compresison/decompression failed.");
fail:
   if (t) fclose(t);
   if (f) fclose(f);
   if (z) fclose(z);
   if (tmp && t) remove(tmp);
   if (zpath && z) remove(zpath);
   if (path)  free(path);
   if (tmp)   free(tmp);
   if (zpath) free(zpath);
}

/* poll for certain X event */
static xcb_generic_event_t* _xcb_get_first_event(uint8_t type) {
   xcb_generic_event_t *ev;
   while ((ev = xcb_poll_for_event(xcb))) {
      if (XCB_EVENT_RESPONSE_TYPE(ev) == type) return ev;
      else free(ev);
   }
   return NULL;
}

/* timed blocking X single event wait */
static xcb_generic_event_t* _xcb_wait_for_single_event(unsigned int seconds, unsigned int nanoseconds, uint8_t type) {
   int ret; fd_set fds;
   unsigned int xfd;
   struct timeval timeout;
   xcb_generic_event_t *ev;

   if ((ev = _xcb_get_first_event(type)))
      return ev;

   timeout.tv_sec  = seconds; timeout.tv_usec = nanoseconds;
   xfd = xcb_get_file_descriptor(xcb);
   FD_ZERO(&fds); FD_SET(xfd, &fds);
   if ((ret = select(xfd+1, &fds, 0, 0, &timeout)) == -1)
      return NULL;
   return ev = _xcb_get_first_event(type);
}

/* timed blockin X event wait */
static xcb_generic_event_t* _xcb_wait_for_event(unsigned int seconds, unsigned int nanoseconds) {
   int ret; fd_set fds;
   unsigned int xfd;
   struct timeval timeout;
   xcb_generic_event_t *ev;

   if ((ev = xcb_poll_for_event(xcb)))
      return ev;

   timeout.tv_sec  = seconds; timeout.tv_usec = nanoseconds;
   xfd = xcb_get_file_descriptor(xcb);
   FD_ZERO(&fds); FD_SET(xfd, &fds);
   if ((ret = select(xfd+1, &fds, 0, 0, &timeout)) == -1)
      return NULL;
   return xcb_poll_for_event(xcb);
}

/* check if we handle this selection */
static clipdata* we_handle_selection(xcb_atom_t selection) {
   int i;
   for (i = 0; i != LENGTH(clipboards); ++i)
      if (clipboards[i].sel == selection)
         return &clipboards[i];
   return NULL;
}

/* check if we handle this special selection */
static specialclip* we_handle_special_selection(xcb_atom_t selection) {
   int i;
   for (i = 0; i != LENGTH(sclip); ++i)
      if (sclip[i].sel == selection)
         return &sclip[i];
   return NULL;
}

/* clear all special selections */
static void clear_special_selections(clipdata *c) {
   unsigned int i;
   if (!(c->flags & CLIPBOARD_CLEAR_SELECTIONS))
      return;

   for (i = 0; i != LENGTH(sclip); ++i) {
      if (sclip[i].data) free(sclip[i].data);
      sclip[i].data = NULL;
      sclip[i].size = 0;
   }
   bclip.data = NULL;
   bclip.size = 0;
}

/* get clipboard by name */
static clipdata* get_clipboard(const char *name) {
   int i;
   for (i = 0; i != LENGTH(clipboards); ++i)
      if (!strcmp(name, clipboards[i].name))
         return &clipboards[i];
   return NULL;
}

/* get special selection by name */
static specialclip* get_special_selection(const char *name) {
   int i;
   for (i = 0; i != LENGTH(sclip); ++i)
      if (!strcmp(name, sclip[i].name))
         return &sclip[i];
   return NULL;
}

/* get owner for selection */
static xcb_atom_t get_owner_for_selection(xcb_atom_t selection) {
   xcb_get_selection_owner_reply_t *reply;
   xcb_atom_t owner = XCB_NONE;
   if ((reply = xcb_get_selection_owner_reply(xcb,
               xcb_get_selection_owner(xcb, selection), NULL))) {
      owner = reply->owner;
      free(reply);
   }
   return owner;
}

/* clear ownership of selection */
static int set_clear(xcb_atom_t selection) {
   int ret = 0;
   xcb_get_selection_owner_reply_t *owner;
   xcb_set_selection_owner(xcb, XCB_NONE, selection, XCB_CURRENT_TIME);
   owner = xcb_get_selection_owner_reply(xcb,
         xcb_get_selection_owner(xcb, selection), NULL);
   if (!owner || owner->owner != xcbw) ret = 1;
   if (owner) free(owner);
   return ret;
}

/* request ownership for selection */
static int set_own(xcb_atom_t selection) {
   int ret = 1;
   xcb_get_selection_owner_reply_t *owner;
   xcb_set_selection_owner(xcb, xcbw, selection, XCB_CURRENT_TIME);
   owner = xcb_get_selection_owner_reply(xcb,
         xcb_get_selection_owner(xcb, selection), NULL);
   if (!owner || owner->owner != xcbw) ret = 0;
   if (owner) free(owner);
   return ret;
}

/* set clipboard ownership */
static int set_clipboard_own(clipdata *c) {
   char *path; int rindex = 0; c->should_own = 0;
   if (c->owner == xcbw) return 1;
   if (set_own(c->sel)) {
      OUT("\2Owning clipboard %s", c->name);
      c->owner = xcbw;
      if (!c->data && (path = get_clipboard_database_path(c, 0))) {
         ls_clipboard(c, path, &rindex, restore_clipboard);
         free(path);
      }
   }
   return c->owner==xcbw;
}

/* clear clipboard ownership */
static int set_clipboard_clear(clipdata *c) {
   OUT("\1Clearing ownership for %s", c->name);
   if (set_clear(c->sel)) c->owner = XCB_NONE;
   return c->owner!=xcbw;
}

/* sync clipboard if it has syncs */
static void sync_clip(clipdata *c) {
   clipdata *s;

   if (!c->sync || !strcmp(c->name, c->sync) || !(s = get_clipboard(c->sync)))
     return;

   set_clipboard_own(s);
   set_clipboard_data(s, (char*)c->data, c->size);
   OUT("\2Synced from %s to %s", c->name, c->sync);
}

/* init X selection/clipboard mess */
static void init_clipboard_protocol(void) {
   unsigned int i = 0;
   xcb_intern_atom_reply_t *reply;
   xcb_intern_atom_cookie_t cookies[LENGTH(natoms)];
   xcb_intern_atom_cookie_t sel_cookies[LENGTH(textsel)];
   xcb_intern_atom_cookie_t clip_cookies[LENGTH(clipboards)];
   xcb_intern_atom_cookie_t special_cookies[LENGTH(sclip)];

   memset(atoms, XCB_NONE, LENGTH(atoms));
   memset(satoms, XCB_NONE, LENGTH(satoms));
   for (i = 0; i != LENGTH(natoms); ++i)
      cookies[i] = xcb_intern_atom(xcb, 0, strlen(natoms[i]), natoms[i]);
   for (i = 0; i != LENGTH(textsel); ++i)
      sel_cookies[i] = xcb_intern_atom(xcb, 0, strlen(textsel[i]), textsel[i]);
   for (i = 0; i != LENGTH(clipboards); ++i)
      clip_cookies[i] = xcb_intern_atom(xcb, 0, strlen(clipboards[i].name), clipboards[i].name);
   for (i = 0; i != LENGTH(sclip); ++i)
      special_cookies[i] = xcb_intern_atom(xcb, 0, strlen(sclip[i].name), sclip[i].name);

   for (i = 0; i != LENGTH(natoms); ++i) {
      if (!(reply = xcb_intern_atom_reply(xcb, cookies[i], NULL)))
         continue;
      atoms[i] = reply->atom;
      OUT("[%d] %s = 0x%x", i, natoms[i], reply->atom);
      free(reply);
   }

   for (i = 0; i != LENGTH(textsel); ++i) {
      if (!(reply = xcb_intern_atom_reply(xcb, sel_cookies[i], NULL)))
         continue;
      atoms[LENGTH(natoms)+i] = satoms[i] = reply->atom;
      OUT("[%d] %s = 0x%x", LENGTH(natoms)+i, textsel[i], reply->atom);
      free(reply);
   }

   for (i = 0; i != LENGTH(clipboards); ++i) {
      if (!strcmp(clipboards[i].name, "CLIPBOARD")) clipboards[i].has_special = 1;
      if (!(reply = xcb_intern_atom_reply(xcb, clip_cookies[i], NULL)))
         continue;
      clipboards[i].sel = reply->atom;
      if (!(clipboards[i].owner = get_owner_for_selection(reply->atom))) {
         if (!set_clipboard_own(&clipboards[i])) {
            ERR("Failed to take ownership for %s", clipboards[i].name);
         } else sync_clip(&clipboards[i]);
      }
      OUT("%s = 0x%x", clipboards[i].name, reply->atom);
      free(reply);
   }

   for (i = 0; i != LENGTH(sclip); ++i) {
      if (!(reply = xcb_intern_atom_reply(xcb, special_cookies[i], NULL)))
         continue;
      sclip[i].sel = reply->atom;
      satoms[LENGTH(textsel)+i] = sclip[i].sel;
      OUT("%s = 0x%x", sclip[i].name, reply->atom);
      free(reply);
   }
}

/* init X window */
static void init_window(void) {
   xcbw = xcb_generate_id(xcb);
   xcb_screen = xcb_setup_roots_iterator(xcb_get_setup(xcb)).data;
   xcb_create_window(xcb, xcb_screen->root_depth, xcbw, xcb_screen->root,
         0, 0, 1, 1, 0, XCB_COPY_FROM_PARENT, xcb_screen->root_visual,
         XCB_CW_BACK_PIXEL | XCB_CW_OVERRIDE_REDIRECT | XCB_CW_EVENT_MASK,
         (unsigned int[]){xcb_screen->black_pixel, 1, XCB_EVENT_MASK_PROPERTY_CHANGE});
   xcb_map_window(xcb, xcbw);
}

/* handle incr transfer */
static void* get_incr(xcb_selection_notify_event_t *e, size_t *inlen) {
   xcb_generic_event_t *gev = NULL;
   xcb_property_notify_event_t *ev = NULL;
   xcb_get_property_reply_t *reply = NULL;
   void *data = NULL, *tmp;
   size_t len = 0;

   OUT("WAIT FOR INCR!");
   xcb_change_window_attributes(xcb, e->requestor, XCB_CW_EVENT_MASK, &(unsigned int){XCB_EVENT_MASK_PROPERTY_CHANGE});
   xcb_delete_property(xcb, e->requestor, e->property);
   xcb_flush(xcb);

   while ((gev = _xcb_wait_for_event(xcb_timeout_incr, 0))) {
      if (XCB_EVENT_RESPONSE_TYPE(gev) == XCB_SELECTION_NOTIFY) {
         handle_notify((xcb_selection_notify_event_t*)gev);
         free(gev);
         continue;
      } else if (XCB_EVENT_RESPONSE_TYPE(gev) != XCB_PROPERTY_NOTIFY) {
         free(gev);
         continue;
      }

      ev = (xcb_property_notify_event_t*)gev;
      if (ev->state != XCB_PROPERTY_NEW_VALUE) {
         free(ev);
         continue;
      }

      reply = xcb_get_property_reply(xcb, xcb_get_property(xcb, 0, e->requestor, e->property,
               XCB_GET_PROPERTY_TYPE_ANY, 0, UINT_MAX), NULL);
      if (!reply || !reply->value_len) {
         OUT("INCR end");
         if (reply) free(reply);
         free(ev);
         break;
      }

      OUT("\4Got \3%u bytes [%d]", reply->value_len, reply->format);
      if (!data) {
         if (!(data = malloc(reply->value_len+1)))
            goto out_of_memory;
      } else {
         if (data && (tmp = realloc(data, reply->value_len+len+1)))
            data = tmp;
         else if (data) goto out_of_memory;
      }

      memcpy(data+len, xcb_get_property_value(reply), reply->value_len);
      len += reply->value_len;
      free(reply); free(ev);
      xcb_delete_property(xcb, e->requestor, e->property);
      xcb_flush(xcb);
   }

   /* store */
   if (data) memset(data+len, 0, 1);
   OUT("\4Finished with \3%zu bytes", len);
   if (inlen) *inlen = len;
   xcb_delete_property(xcb, e->requestor, e->property);
   xcb_change_window_attributes(xcb, e->requestor, XCB_CW_EVENT_MASK, &(unsigned int){0});
   return data;

out_of_memory:
   ERR("\1Out of memory for INCR transfer!");
   if (reply) free(reply);
   if (data)  free(data);
   if (ev)    free(ev);
   return NULL;
}

/* fetch selection from selection notify event */
static void* fetch_xsel(xcb_window_t win, xcb_atom_t property, xcb_atom_t type, size_t *len) {
   xcb_get_property_reply_t *xsel = NULL;
   void *data, *string = NULL; *len = 0;

   if (!property) return NULL;
   if (!(xsel = xcb_get_property_reply(xcb, xcb_get_property(xcb, 0,
            win, property, type, 0, UINT_MAX), 0)))
      return NULL;

   if (!(data = xcb_get_property_value(xsel))) {
      free(xsel);
      return NULL;
   }

   if (!xsel->value_len) {
      free(xsel);
      return NULL;
   }

   if (!(string = malloc(xsel->value_len+1))) {
      free(xsel);
      return NULL;
   }

   memcpy(string, data, xsel->value_len);
   memset(string+xsel->value_len, 0, 1);

   *len = xsel->value_len; free(xsel);
   xcb_delete_property(xcb, win, property);
   return string;
}

typedef struct incrtransfer {
   xcb_window_t requestor;
   xcb_atom_t property;
   xcb_atom_t selection;
   unsigned int time;
   xcb_atom_t target;
   int format;
   void *data;
   size_t size;
   size_t offset;
   size_t max_size;
   size_t chunk;
   struct incrtransfer *next;
} incrtransfer;

static incrtransfer *transfers = NULL;

static void add_incr(incrtransfer *incr) {
   incrtransfer *i;
   incr->next = NULL;
   for (i = transfers; i && i->next; i = i->next);
   if (!i) i = transfers = malloc(sizeof(incrtransfer));
   else i = i->next = malloc(sizeof(incrtransfer));
   if (!i) return;
   memcpy(i, incr, sizeof(incrtransfer));
}

static void free_incr(incrtransfer *incr) {
   incrtransfer *i;
   for (i = transfers; i && i->next != i; i = i->next);
   if (!i) transfers = incr->next;
   else i->next = incr->next;
   free(incr);
}

static void free_incrs(void) {
   incrtransfer *i, *n;
   for (i = transfers; i; i = n) {
      n = i->next;
      free(i);
   }
}

static incrtransfer* find_incr(xcb_atom_t atom) {
   incrtransfer *i;
   for (i = transfers; i && i->property != atom; i = i->next);
   return i;
}

static void complete_incr(incrtransfer *incr) {
   xcb_selection_notify_event_t ev;

   ev.response_type = XCB_SELECTION_NOTIFY;
   ev.requestor = incr->requestor;
   ev.selection = incr->selection;
   ev.time      = incr->time;
   ev.target    = incr->target;
   ev.property  = incr->offset==incr->size?incr->property:XCB_NONE;

   xcb_send_event(xcb, 0, ev.requestor, XCB_EVENT_MASK_NO_EVENT, (char*)&ev);
   xcb_change_window_attributes(xcb, ev.requestor, XCB_CW_EVENT_MASK, &(unsigned int){0});
   free_incr(incr); xcb_flush(xcb);
}

/* xcb_change_property wrapper with INCR handling */
static int _xcb_change_property(xcb_connection_t *xcb, xcb_selection_notify_event_t *ev,
      uint8_t mode, xcb_atom_t target, int format, size_t size, void *data) {
   unsigned int bytes;

   /* not possible */
   if (!data || !size)
      return -1;

   bytes = size*format/8;
   OUT("check %zu bytes", bytes);
   if (bytes < MAX_INCR) {
      xcb_change_property(xcb, mode, ev->requestor, ev->property, target, format, size, data);
      return 0;
   }

   /* INCR transfer */
   ev->target = atoms[INCR];
   xcb_change_window_attributes(xcb, ev->requestor, XCB_CW_EVENT_MASK, &(unsigned int){XCB_EVENT_MASK_PROPERTY_CHANGE});
   xcb_change_property(xcb, mode, ev->requestor, ev->property, atoms[INCR], 32, 1, (unsigned char*)&bytes);
   xcb_send_event(xcb, 0, ev->requestor, XCB_EVENT_MASK_NO_EVENT, (char*)ev);
   xcb_flush(xcb);

   incrtransfer incr;
   incr.requestor = ev->requestor;
   incr.property  = ev->property;
   incr.selection = ev->selection;
   incr.time      = ev->time;
   incr.target    = target;
   incr.format    = format;
   incr.data      = data;
   incr.size      = size;
   incr.offset    = 0;
   incr.max_size  = MAX_INCR*8/format;
   incr.chunk = MIN(incr.max_size, incr.size-incr.offset);
   add_incr(&incr);

   OUT("\4INCR transfer! (%zu/%zu)", incr.size, incr.max_size);
   return 1;
}

/* send X selection */
static void send_xsel(xcb_window_t requestor, xcb_atom_t property, xcb_atom_t selection,
      xcb_atom_t target, xcb_time_t time, size_t size, void *data) {
   int incr = 0;
   unsigned int i, hasdata;
   xcb_atom_t tatoms[LENGTH(satoms)];
   specialclip *s = NULL;
   xcb_selection_notify_event_t ev;
   ev.response_type = XCB_SELECTION_NOTIFY;
   ev.target      = target;
   ev.requestor   = requestor;
   ev.selection   = selection;
   ev.time        = time;
   ev.property    = property;

   if (!ev.property) ev.property = ev.target;
   if (!xcb_timestamp) xcb_timestamp = time;
   if (ev.time != XCB_CURRENT_TIME && ev.time < xcb_timestamp) {
      OUT("Crap timestamp");
      ev.property = XCB_NONE;
   }

   if (target == atoms[UTF8_STRING]) {
      OUT("UTF8 request");
      incr = _xcb_change_property(xcb, &ev, XCB_PROP_MODE_REPLACE, atoms[UTF8_STRING], 8, size, data);
   } else if (target == atoms[STRING] || target == atoms[TEXT]) {
      OUT("String || Text request");
      incr = _xcb_change_property(xcb, &ev, XCB_PROP_MODE_REPLACE, atoms[STRING], 8, size, data);
   } else if (target == atoms[TIMESTAMP]) {
      OUT("Timestamp request");
      incr = _xcb_change_property(xcb, &ev, XCB_PROP_MODE_REPLACE, atoms[INTEGER], 32, 1, (unsigned char*)&ev.time);
   } else if (target == atoms[TARGETS]) {
      OUT("Targets request");
      for (i = 0, hasdata = 0; i != LENGTH(textsel); ++i) {
         if (satoms[i] == atoms[UTF8_STRING] ||
             satoms[i] == atoms[TEXT] ||
             satoms[i] == atoms[STRING]) {
            if (data && size) {
               tatoms[hasdata++] = satoms[i];
               OUT("Has text data");
            }
         } else tatoms[hasdata++] = satoms[i];
      }
      for (i = 0; i != LENGTH(sclip); ++i)
         if (sclip[i].size && sclip[i].data) {
            OUT("Hasdata: %s", sclip[i].name);
            tatoms[hasdata++] = sclip[i].sel;
         }
      incr = _xcb_change_property(xcb, &ev, XCB_PROP_MODE_REPLACE, atoms[ATOM], 32, hasdata, tatoms);
#if 0
   } else if (target == atoms[MULTIPLE]) {
      OUT("Multiple");
      ev.property = XCB_NONE;
#endif
   } else {
      if ((s = we_handle_special_selection(target))) {
         OUT("Special data request from %s", s->name);
         if (s->size && s->data)
            incr = _xcb_change_property(xcb, &ev, XCB_PROP_MODE_REPLACE, s->sel, 8, (size = s->size), (data = s->data));
         else {
            OUT("No data, report it!");
            ev.property = XCB_NONE;
         }
      } else {
         OUT("Crap property");
         ev.property = XCB_NONE;
      }
   }

   if (!incr && incr != -1) {
      if (ev.target == atoms[UTF8_STRING] ||
          ev.target == atoms[STRING]      ||
          ev.target == atoms[TEXT])
         OUT("SENT: %s [%zu]", (char*)data, size);
      xcb_send_event(xcb, 0, ev.requestor, XCB_EVENT_MASK_NO_EVENT, (char*)&ev);
      xcb_flush(xcb);
   }
}

/* handle selection request */
static void handle_request(xcb_selection_request_event_t *e) {
   char *data = NULL; size_t size = 0;
   clipdata *c;

   OUT("\3xcb: selection request");
   if ((c = we_handle_selection(e->selection))) {
      data = c->data;
      size = c->size;
   }

   send_xsel(e->requestor, e->property, e->selection,
         e->target, e->time, size, data);
}

/* hash char buffer */
static unsigned int hashb(char *b, size_t len) {
   unsigned int hash = 0; size_t i;
   for (i = 0; i != len; ++i) {
      hash += b[i];
      hash += (hash << 10);
      hash ^= (hash >> 6);
   }

   hash += (hash << 3);
   hash ^= (hash >> 11);
   hash += (hash << 15);
   return hash;
}

/* handle clip */
static void handle_clip(clipdata *c, void *buffer, size_t len) {
   unsigned int hash, changed;
   if (!buffer || !len) return;

   /* can we copy the data immediatly? or do we need to
    * let go can wait until copy is done.
    *
    * this is only neccessary to PRIMARY, so that the
    * history won't get bloated with non full selections. */
   if (!strcmp(c->name, "PRIMARY")) {
      if ((hash = hashb(buffer, len)) != c->ohash) {
         OUT("\4Start of %s copy", c->name);
         c->ohash = hash; return;
      } else {
         if (c->hash == c->ohash) return;
         OUT("\4End of %s copy", c->name);
      }
   } else {
      OUT("\4Got data from %s", c->name);
      if (c->ohash == (hash = hashb(buffer, len))) {
         /* should own immediatly? */
         if (c->flags & CLIPBOARD_OWN_IMMEDIATLY) {
            c->should_own = 1;
            sync_clip(c);
         }
         return;
      }
      c->ohash = hash;
   }

   changed = set_clipboard_data(c, buffer, len);
   c->hash = hashb(c->data, c->size);
   if (!changed || (c->hash == hash && c->ohash != c->hash)) {
      /* should own immediatly? */
      if (c->flags & CLIPBOARD_OWN_IMMEDIATLY) {
         c->should_own = 1;
         sync_clip(c);
      }
      return;
   }

   /* sync and maybe store? */
   sync_clip(c);
   if (!(c->cflags & CLIP_SKIP_HISTORY) && c->maxclips > 0)
      store_clip(c);

   /* should own immediatly? */
   if (c->flags & CLIPBOARD_OWN_IMMEDIATLY)
      c->should_own = 1;
}

/* handle special copy */
static void handle_special_copy(clipdata *c, specialclip *s, void *buffer, size_t len) {
   if (!buffer) return;
   else if (!len) {
      free(buffer);
      return;
   }

   OUT("Got special data from %s", s->name);
   if (!set_special_selection_data(s, buffer, len)) {
      free(buffer);
      return;
   }

   if (s->share_binary)
      bclip.dont_set = 1;

   if (c->flags & CLIPBOARD_OWN_IMMEDIATLY)
      c->should_own = 1;
}

/* handle copying */
static void handle_copy(clipdata *c, void *buffer, size_t len) {
   if (!buffer || !len) return;

   handle_clip(c, buffer, len);
}


/* request copy */
static void request_copy(clipdata *c) {
   unsigned int i = 0;

   if (c->has_special) {
      bclip.dont_set = 0;
      for (i = 0; i != LENGTH(sclip); ++i) sclip[i].dont_set = 0;
   }

   xcb_convert_selection(xcb, xcbw, c->sel,
         atoms[TARGETS], atoms[XSEL_DATA], XCB_CURRENT_TIME);
   OUT("Targets request for %s", c->name);
   c->is_waiting   = 5;
   c->cycle_target = 0;
}

/* handle clear request */
static void handle_clear(xcb_selection_clear_event_t *e) {
   clipdata *c;

   OUT("\3xcb: clear request");
   if (!(c = we_handle_selection(e->selection)))
      return;

   OUT("\1Clearing clipboard %s", c->name);
   c->owner      = XCB_NONE;
   c->should_own = 0;
}

/* get targets from reply */
static xcb_atom_t* get_targets(clipdata *c, xcb_get_property_reply_t *r, unsigned int *len)
{
   xcb_atom_t *targets;
   unsigned int sup, i;
   char got_text = 0, got_shared = 0;
   specialclip *s;
   if (!r) return NULL;
   xcb_atom_t stargets[r->value_len];

   targets = xcb_get_property_value(r);
   for (i = 0, sup = 0; i != r->value_len; ++i) {
      OUT("[%d] 0x%x", i, targets[i]);
      if (c->has_special && (s = we_handle_special_selection(targets[i]))) {
         if ((s->share_binary && !got_shared) || !s->share_binary)
            stargets[sup++] = targets[i];
         if (s->share_binary) got_shared = 1;
      } else if (!got_text &&
               (targets[i] == atoms[UTF8_STRING] ||
                targets[i] == atoms[STRING]      ||
                targets[i] == atoms[TEXT])) {
         stargets[sup++] = targets[i];
         got_text = 1;
      }
   }

   if (!sup || !(targets = malloc(sup*sizeof(xcb_atom_t))))
      return NULL;

   *len = sup;
   memcpy(targets, stargets, sup*sizeof(xcb_atom_t));
   return targets;
}

/* welcome to the pits of hell */
static void ask_for_next_selection(clipdata *c) {
   if (!c->targets || !c->cycle_target) {
      c->is_waiting = 0;
      return;
   }

   OUT("ASK FOR 0x%x", c->targets[c->num_targets-c->cycle_target]);
   xcb_convert_selection(xcb, xcbw, c->sel,
         c->targets[c->num_targets-c->cycle_target],
         atoms[XSEL_DATA], XCB_CURRENT_TIME);
   --c->cycle_target;
}

/* handle selection notify */
static void handle_notify(xcb_selection_notify_event_t *e) {
   xcb_get_property_reply_t *reply;
   void *string = NULL; size_t len = 0;
   clipdata *c; specialclip *s;

   if (!(c = we_handle_selection(e->selection)))
      return;

   if (!(reply = xcb_get_property_reply(xcb, xcb_get_property(xcb, 0, e->requestor, e->property,
            XCB_GET_PROPERTY_TYPE_ANY, 0, UINT_MAX), NULL))) {
      c->should_own = 1;
      OUT("\1Failed reply");
      ask_for_next_selection(c);
      if (c->is_waiting) --c->is_waiting;
      xcb_flush(xcb);
      return;
   }

   if (reply->type == atoms[ATOM]) {
      if (c->targets) free(c->targets);
      if ((c->targets = get_targets(c, reply, &c->num_targets))) {
            xcb_convert_selection(xcb, xcbw, c->sel,
                  c->targets[0], atoms[XSEL_DATA], XCB_CURRENT_TIME);
            OUT("Ask for: 0x%x", c->targets[0]);
         c->is_waiting   = c->num_targets+5;
         c->cycle_target = c->num_targets;
         OUT("%d valid targets for %s", c->num_targets, c->name);
      } else {
         OUT("No valid targets, own!");
         c->is_waiting = 0;
         c->should_own = 1;
      }
   } else if (reply->type == atoms[INTEGER]) {
      OUT("\1Timestamp not read");
   } else if (reply->type != atoms[INCR]) { /* NON INCR */
      OUT("NON INCR [0x%x]", reply->type);
      string = fetch_xsel(e->requestor, e->property, e->target, &len);
      if ((s = we_handle_special_selection(e->target))) {
         handle_special_copy(c, s, string, len); /* string is not copied */
         string = NULL; /* don't free */
      } else {
         handle_copy(c, string, len); /* string is copied */
      }
      ask_for_next_selection(c);
      if (c->is_waiting) --c->is_waiting;
   } else { /* INCR */
      OUT("INCR [0x%x]", reply->type);
      string = get_incr(e, &len);
      if ((s = we_handle_special_selection(e->target))) {
         handle_special_copy(c, s, string, len); /* string is not copied */
         string = NULL; /* don't free */
      } else {
         handle_copy(c, string, len); /* string is copied */
      }
      ask_for_next_selection(c);
      if (c->is_waiting) --c->is_waiting;
   }

   free(reply);
   if (string) free(string);
   xcb_flush(xcb);
   OUT("FLUSH");
}

/* handle property notify */
static void handle_property(xcb_property_notify_event_t *e) {
   incrtransfer *incr;
   if (e->state != XCB_PROPERTY_DELETE) return;

   if (!(incr = find_incr(e->atom)))
      return;

   if (!incr->offset) {
      OUT("\4Writing first INCR chunk (%zu/%zu)", incr->chunk, incr->size);
      xcb_change_property(xcb, XCB_PROP_MODE_REPLACE, incr->requestor, incr->property, incr->target,
            incr->format, incr->chunk, incr->data);
      incr->offset += incr->chunk; xcb_flush(xcb);
      return;
   }

   incr->chunk = MIN(incr->max_size, incr->size-incr->offset);
   if (!incr->chunk) {
      OUT("\4Ending INCR transfer (%zu)", incr->offset);
      xcb_change_property(xcb, XCB_PROP_MODE_APPEND, incr->requestor, incr->property, incr->target,
            incr->format, 0, NULL);
      complete_incr(incr);
   } else {
      OUT("\4Transfering \3%zu bytes (%zu/%zu)", incr->chunk, incr->offset, incr->size);
      xcb_change_property(xcb, XCB_PROP_MODE_APPEND, incr->requestor, incr->property, incr->target,
            incr->format, incr->chunk, incr->data+incr->offset);
      incr->offset += incr->chunk; xcb_flush(xcb);
   }
}

/* check if one instance is already running */
#include <sys/file.h>
static int check_lock(int unlock) {
   unsigned int fd;
   if ((flock((fd = open(LOCK_FILE, O_CREAT | O_RDWR, 0666)),
               LOCK_EX | LOCK_NB))) {
      if (EWOULDBLOCK != errno) ERR("Failed to write lock file");
      return 0;
   }
   if (unlock) flock(fd, LOCK_UN | LOCK_NB);
   return 1;
}

/* check if fd is ready */
static int fdcheck(unsigned int fd) {
   fd_set fdset;
   struct timeval tm;
   FD_ZERO(&fdset);
   FD_SET(fd, &fdset);
   tm.tv_sec   = 1;
   tm.tv_usec  = 0;
   return select(fd+1, &fdset, NULL, NULL, &tm)==1?1:0;
}

/* parse data as CLI argument */
static char* get_data_as_argument(int argc, char **argv, size_t *len) {
   char buffer[1024], *data = NULL, *tmp;
   size_t size = 0, read; int i; *len = 0;

   /* 100% sure we are terminal */
   if (!argc && isatty(fileno(stdin)))
      return NULL;

   if (!argc) {
      while (fdcheck(fileno(stdin)) &&
            (read = fread(buffer, 1, sizeof(buffer), stdin))) {
         if (data && (tmp = realloc(data, size+read+1)))
            data = tmp;
         else if (data) goto out_of_memory;
         else data = malloc(read+1);
         if (!data) goto out_of_memory;
         memcpy(data+size, buffer, read);
         size += read;
      }
      if (!data) goto no_arg;
   } else {
      for (i = 0; i != argc; ++i) {
         if (data && (tmp = realloc(data, size+strlen(argv[i])+2)))
            data = tmp;
         else if (data) goto out_of_memory;
         else data = malloc(strlen(argv[i])+1);
         if (!data) goto out_of_memory;
         if (size) data[size] = ' ';
         memcpy(data+(size?size+1:0), argv[i], strlen(argv[i]));
         size += strlen(argv[i])+(size?1:0);
      }
      if (!data) goto no_arg;
   }
   data[size] = 0;
   *len = size;
   return data;

out_of_memory:
   MEMERR();
   goto fail;
no_arg:
   ERR("No data supplied as argument nor from stdin.");
fail:
   if (data) free(data);
   return NULL;
}

/* wait for X selection */
static void* get_xsel(xcb_atom_t selection, xcb_atom_t type, size_t *len) {
   xcb_selection_notify_event_t *e;
   xcb_get_property_reply_t *reply;
   void *string = NULL;

   xcb_convert_selection(xcb, xcbw, selection, type, atoms[XSEL_DATA], XCB_CURRENT_TIME);
   xcb_flush(xcb);

   while ((e = (xcb_selection_notify_event_t*)_xcb_wait_for_single_event(
               xcb_timeout_xsel_s, xcb_timeout_xsel_ns, XCB_SELECTION_NOTIFY))) {
      if ((reply = xcb_get_property_reply(xcb, xcb_get_property(xcb, 0, e->requestor, e->property,
               XCB_GET_PROPERTY_TYPE_ANY, 0, UINT_MAX), NULL))) {
         if (reply->type == atoms[ATOM]) {
            if ((string = malloc(reply->value_len*sizeof(xcb_atom_t)))) {
               memcpy(string, xcb_get_property_value(reply), reply->value_len*sizeof(xcb_atom_t));
               *len   = reply->value_len;
            }
            xcb_delete_property(xcb, e->requestor, e->property);
         } else if (reply->type == atoms[INTEGER]) {
            OUT("TIMESTAMP!");
            xcb_delete_property(xcb, e->requestor, e->property);
         } else if (reply->type != atoms[INCR])
              string = fetch_xsel(e->requestor, e->property, e->target, len);
         else string = get_incr(e, len);
         free(reply);
         xcb_flush(xcb);
      }
      free(e);
      if (string || !reply) break;
   }

   return string;
}

/* set X selection (blocks until clipboard is taken) */
static int set_xsel(xcb_atom_t selection, xcb_atom_t target, void *buffer, size_t len) {
   xcb_generic_event_t *ev = NULL;
   xcb_selection_clear_event_t *sc;
   xcb_selection_request_event_t *sr;

   OUT("\3Setting selection to X and blocking until it's taken");
   if (!set_own(selection)) return -1;
   while ((ev = _xcb_wait_for_event(xcb_timeout_xsel_s, xcb_timeout_xsel_ns)) || 1) {
      if (ev) {
         if (XCB_EVENT_RESPONSE_TYPE(ev) == XCB_SELECTION_CLEAR) {
            sc = (xcb_selection_clear_event_t*)ev;
            OUT("xcb: clear request");
            if (sc->selection == selection) break;
         } else if (XCB_EVENT_RESPONSE_TYPE(ev) == XCB_SELECTION_REQUEST) {
            sr = (xcb_selection_request_event_t*)ev;
            OUT("xcb: selection request");
            if (sr->selection == selection) {
               send_xsel(sr->requestor, sr->property, sr->selection,
                     sr->target, sr->time, len, buffer);
            }
         } else if (XCB_EVENT_RESPONSE_TYPE(ev) == XCB_PROPERTY_NOTIFY) {
            handle_property((xcb_property_notify_event_t*)ev);
         }
      }
      if (ev) free(ev);
   }

   if (ev) free(ev);
   return 1;
}

/* do clipboard synchorization requested from command line */
static int do_sync(const char *selection, int argc, char **argv) {
   xcb_atom_t *targets; specialclip *s;
   void *sbuffer;
   char *buffer; size_t len = 0, tlen = 0, slen = 0, i; clipdata *c;
   if ((buffer = get_data_as_argument(argc, argv, &len))) {
      OUT("\4Sync %s", selection);
#ifndef NDEBUG
      if (len) {
         for (i = 0; i != len; ++i)
            printf("%c", buffer[i]);
      }
#else
      if (!WAIT_MODE && daemon(0, 0) != 0) {
         ERR("\1Failed to become a daemon");
         return -1;
      }
#endif
      if (!(c = get_clipboard(selection)))
         goto fail;

      targets = get_xsel(c->sel, atoms[TARGETS], &tlen);
      OUT("Targets length: %zu", tlen);

      /* set all special selections */
      for (i = 0; i != tlen; ++i) {
         OUT("0x%x", targets[i]);
         if (!(s = we_handle_special_selection(targets[i])))
            continue;

         sbuffer = get_xsel(c->sel, s->sel, &slen);
         if (s->share_binary) bclip.dont_set = 1;
         set_special_selection_data(s, sbuffer, slen);
         if (sbuffer && slen) OUT("\3Got data from %s", s->name);
      }
      free(targets);

      /* broadcast */
      set_xsel(c->sel, XCB_NONE, buffer, len);
      if (buffer) free(buffer);
   } else {
      OUT("\4Get selection from %s", selection);
      if (!(c = get_clipboard(selection)))
         goto fail;

      buffer = get_xsel(c->sel, atoms[UTF8_STRING], &len);
      if (!buffer) buffer = get_xsel(c->sel, atoms[STRING], &len);
      if (buffer && len)
         for (i = 0; i != len; ++i)
            printf("%c", buffer[i]);
      if (buffer) free(buffer);
   }
   return 1;
fail:
   ERR("%s isn't a registered clipboard.", selection);
   free(buffer);
   return -1;
}

/* select registered clibpoard from command line */
static int select_selection(const char *selection) {
   clipdata *c;
   OUT("\4%s selected", selection);
   if (!(c = get_clipboard(selection)))
      goto fail;
   c->selected = 1;
   return 1;
fail:
   ERR("%s isn't a registered clipboard.", selection);
   return -1;
}

#define FUNC_ARG(x) static int x(int argc, char **argv)
FUNC_ARG(arg_daemon) {
   OUT("\2Daemonize");
   if (!check_lock(1)) return 0;
   if (daemon(0, 0) != 0) ERR("\1Failed to become a daemon");
   return 0;
}

FUNC_ARG(arg_primary) {
   return select_selection("PRIMARY");
}

FUNC_ARG(arg_primary_sync) {
   return do_sync("PRIMARY", argc, argv);
}

FUNC_ARG(arg_secondary) {
   return select_selection("SECONDARY");
}

FUNC_ARG(arg_secondary_sync) {
   return do_sync("SECONDARY", argc, argv);
}

FUNC_ARG(arg_clipboard) {
   return select_selection("CLIPBOARD");
}

FUNC_ARG(arg_clipboard_sync) {
   return do_sync("CLIPBOARD", argc, argv);
}

FUNC_ARG(arg_get) {
   int o; char lsall = 1, *path, *data;
   unsigned int arg; size_t len;

   OUT("\4Getting from history");
   if (!(data = get_data_as_argument(argc, argv, &len)))
      return -1;

   arg = strtol(data, (char**)NULL, 10);
   for (o = 0; o != LENGTH(clipboards); ++o)
      if (clipboards[o].selected) lsall = 0;

   for (o = 0; o != LENGTH(clipboards); ++o) {
      if ((lsall || clipboards[o].selected) &&
          (path = get_clipboard_database_path(&clipboards[o], 0))) {
         ls_clipboard(&clipboards[o], path, &arg, ls_get);
         free(path);
      }
   }
   return 1;
}

FUNC_ARG(arg_list) {
   int o; char lsall = 1, *path;

   OUT("\4Listing history");
   for (o = 0; o != LENGTH(clipboards); ++o)
      if (clipboards[o].selected) lsall = 0;

   for (o = 0; o != LENGTH(clipboards); ++o) {
      if ((lsall || clipboards[o].selected) &&
          (path = get_clipboard_database_path(&clipboards[o], 0))) {
         ls_clipboard(&clipboards[o], path, NULL, ls_puts);
         free(path);
      }
   }
   return 1;
}

FUNC_ARG(arg_dmenu) {
   int o; char lsall = 1, *path;

   OUT("\4Listing for dmenu");
   for (o = 0; o != LENGTH(clipboards); ++o)
      if (clipboards[o].selected) lsall = 0;

   for (o = 0; o != LENGTH(clipboards); ++o) {
      if ((lsall || clipboards[o].selected) &&
          (path = get_clipboard_database_path(&clipboards[o], 0))) {
         ls_clipboard(&clipboards[o], path, NULL, dmenu_puts);
         free(path);
      }
   }
   return 1;
}

FUNC_ARG(arg_clear) {
   int o; char lsall = 1, *path;

   OUT("\4Clearing history");
   for (o = 0; o != LENGTH(clipboards); ++o)
      if (clipboards[o].selected) lsall = 0;

   for (o = 0; o != LENGTH(clipboards); ++o) {
      if ((lsall || clipboards[o].selected) &&
          (path = get_clipboard_database_path(&clipboards[o], 0))) {
         remove(path); free(path);
      }
   }
   return 1;
}

FUNC_ARG(arg_query) {
   if (check_lock(1)) {
      ERR("loliclip daemon is not running.");
      return -1;
   }
   return 1;
}

FUNC_ARG(arg_wait) {
   WAIT_MODE = 1;
   OUT("WAIT MODE");
   return 1;
}

FUNC_ARG(arg_binary) {
   xcb_atom_t *targets;
   char *buffer; size_t i, len = 0, tlen = 0;
   clipdata *c; specialclip *s, *s2;

   if (!(c = get_clipboard("CLIPBOARD")))
      goto no_clipboard;
   if (!(s = get_special_selection(argv[0])))
      goto no_selection;

   if ((buffer = get_data_as_argument(argc-1, (argc-1?++argv:argv), &len))) {
#ifdef NDEBUG
      if (!WAIT_MODE && daemon(0, 0) != 0) {
         ERR("\1Failed to become a daemon");
         return -1;
      }
#endif

      /* set our data */
      set_special_selection_data(s, buffer, len);
      if (s->share_binary) bclip.dont_set = 1;

      targets = get_xsel(c->sel, atoms[TARGETS], &tlen);
      OUT("Targets length: %zu", tlen);

      /* set all other special selections */
      for (i = 0; i != tlen; ++i) {
         if (targets[i] == s->sel) continue;
         OUT("0x%x", targets[i]);
         if (!(s2 = we_handle_special_selection(targets[i])))
            continue;

         buffer = get_xsel(c->sel, s2->sel, &len);
         set_special_selection_data(s2, buffer, len);
         if (s2->share_binary) bclip.dont_set = 1;
         if (buffer && len) OUT("\3Got data from %s", s2->name);
      }
      free(targets);

      /* set normal buffer */
      buffer = get_xsel(c->sel, atoms[UTF8_STRING], &len);
      if (!buffer) buffer = get_xsel(c->sel, atoms[STRING], &len);
      if (buffer) OUT("\1Got normal UTF8 data");

      /* broadcast */
      set_xsel(c->sel, s->sel, buffer, len);
      if (buffer) free(buffer);
   } else {
      buffer = get_xsel(c->sel, s->sel, &len);
      if (buffer && len) {
         for (i = 0; i != len; ++i)
            printf("%c", buffer[i]);
      }
      if (buffer && buffer != s->data)
         free(buffer);
   }

   return 1;
no_clipboard:
   ERR("CLIPBOARD isn't a registered clipboard.");
   goto fail;
no_selection:
   ERR("\1No such selection target: \5%s", argv[0]);
fail:
   return -1;
}

#undef FUNC_ARG

/* show usage */
static int usage(char *name) {
   int o;
   printf("usage: %s [-", basename(name));
   for (o = 0; o != LENGTH(clipargs); ++o)
      printf("%c", clipargs[o].arg);
   printf("]\n");
   for (o = 0; o != LENGTH(clipargs); ++o)
      printf("\t--%s\t%s\n", clipargs[o].full, clipargs[o].desc);

   printf("\nValid arguments for the --binary switch:\n");
   for (o = 0; o != LENGTH(sclip); ++o)
      printf("\t%s\n", sclip[o].name);
   return 1;
}

/* unknown argument handling */
static int unknown_arg(char *name, char *full, char arg) {
   ERR("unknown argument: %s%.0c", full?full:"", arg);
   return usage(name);
}

/* handle arguments */
static int handle_args(int argc, char **argv) {
   char *s; int ret, dolonely = 1;
   unsigned int o, a, skipusage = 0, unknown;

   for (a = 1; a != argc; ++a){
      if (argv[a][0] != '-') continue;
      if (!strcmp(argv[a], "--help") || !strcmp(argv[a], "-h")) return usage(argv[0]);
      if (argv[a][1] == '-' && argv[a][2]) {
         unknown = 1;
         for (o = 0; o != LENGTH(clipargs); ++o)
            if (!strcmp(clipargs[o].full, &argv[a][2])) {
               clipargs[o].atarg = a+1;
               skipusage = 1; unknown = 0;
            }
         if (unknown) return unknown_arg(argv[0], argv[a], 0);
      } else {
         for (s = &argv[a][1]; *s; ++s) {
            unknown = 1;
            for (o = 0; o != LENGTH(clipargs); ++o)
               if (*s == clipargs[o].arg) {
                  clipargs[o].atarg = a+1;
                  skipusage = 1; unknown = 0;
               }
            if (unknown) return unknown_arg(argv[0], NULL, *s);
         }
      }
   }

   if (!skipusage) return usage(argv[0]);
   for (o = 0; o != LENGTH(clipargs); ++o)
      if (clipargs[o].atarg && (argc-clipargs[o].atarg) >= clipargs[o].argc) {
         if (!clipargs[o].lonefunc) dolonely = 0;
         ret = clipargs[o].func(argc-clipargs[o].atarg, argv+clipargs[o].atarg);
         if (ret == 0) return 0;
         else if (ret == -1) return -1;
      }

   if (!dolonely)
      return 1;

   for (o = 0; o != LENGTH(clipargs); ++o)
      if (clipargs[o].atarg && clipargs[o].lonefunc) {
         ret = clipargs[o].lonefunc(argc-clipargs[o].atarg, argv+clipargs[o].atarg);
         if (ret == 0) return 0;
         else if (ret == -1) return -1;
      }
   return 1;
}

static int RUN = 1;
static void sigint(int sig) {
   RUN = 0; ERR("\1SIGINT");
}

/* lolis live here */
int main(int argc, char **argv) {
   xcb_generic_event_t *ev = NULL;
   unsigned int i = 0, c = 0, doblock = 0;
   int skiploop = 0;

   /* cli defaults */
   xcb_timeout_xsel_s  = xcb_timeout_cli;
   xcb_timeout_xsel_ns = 0;

   xcb = xcb_connect(NULL, NULL);
   if (xcb_connection_has_error(xcb))
      goto xcb_fail;

   init_window();
   init_clipboard_protocol();
   xcb_flush(xcb);

   if (argc>1)
      if ((skiploop = handle_args(argc, argv)) == -1)
         goto fail;

#ifndef NDEBUG
   signal(SIGINT, sigint);
#endif
   if (!skiploop) {
      if (!check_lock(0)) goto lock_fail;
      ERR("\2Starting loliclip");
      xcb_timeout_xsel_s  = 0;
      xcb_timeout_xsel_ns = xcb_timeout_daemon;
   }

   while (!skiploop && RUN && !xcb_connection_has_error(xcb)) {
      if (doblock) ev = xcb_wait_for_event(xcb);
      while (doblock || (ev = _xcb_wait_for_event(0, xcb_timeout_loop))) {
         if (XCB_EVENT_RESPONSE_TYPE(ev) == XCB_SELECTION_REQUEST)
            handle_request((xcb_selection_request_event_t*)ev);
         else if (XCB_EVENT_RESPONSE_TYPE(ev) == XCB_SELECTION_CLEAR) {
            handle_clear((xcb_selection_clear_event_t*)ev);
            for (c = 0; c != LENGTH(clipboards) && clipboards[c].sel !=
                  ((xcb_selection_clear_event_t*)ev)->selection; ++c);
            --c; free(ev); break;
         } else if (XCB_EVENT_RESPONSE_TYPE(ev) == XCB_SELECTION_NOTIFY)
            handle_notify((xcb_selection_notify_event_t*)ev);
         else if (XCB_EVENT_RESPONSE_TYPE(ev) == XCB_PROPERTY_NOTIFY)
            handle_property((xcb_property_notify_event_t*)ev);
#ifdef XCB_UTIL
         else OUT("\3xcb: \1unhandled event '\5%s\1'", xcb_event_get_label(ev->response_type));
#else
         else OUT("\3xcb: \1unhandled event");
#endif
         free(ev);
         if (doblock && !(ev = xcb_poll_for_event(xcb))) break;
      }

      doblock = 1;
      if (++c == LENGTH(clipboards)) {
         OUT("Handle clipboard %s", clipboards[c].name);
         for (c = 0; c != LENGTH(clipboards); ++c) {
               if (clipboards[c].owner == XCB_NONE &&
                  (clipboards[c].owner = get_owner_for_selection(clipboards[c].sel)) == XCB_NONE)
                  clipboards[c].should_own = 1;

            if (clipboards[c].should_own) set_clipboard_own(&clipboards[c]);
            if (clipboards[c].is_waiting) {
               --clipboards[c].is_waiting;
               doblock = 0;
            }
         }
         c = 0;
      } else doblock = 0;

      OUT("%s [%d]", clipboards[c].name, clipboards[c].is_waiting);
      if (!clipboards[c].is_waiting && clipboards[c].owner != xcbw) {
         if (clipboards[c].should_own) set_clipboard_own(&clipboards[c]);
         clear_special_selections(&clipboards[c]);
         request_copy(&clipboards[c]);
         xcb_flush(xcb);
      }

      if (doblock) {
             OUT("BLOCK");
      } else OUT("LOOP");
   }

   OUT("\1Stopping loliclip");
   for (i = 0; i != LENGTH(clipboards); ++i) {
      if (clipboards[i].owner == xcbw) set_clipboard_clear(&clipboards[i]);
      if (clipboards[i].data) free(clipboards[i].data);
      if (clipboards[i].targets) free(clipboards[i].targets);
   }
   for (i = 0; i != LENGTH(sclip); ++i) {
      if (!sclip[i].share_binary && sclip[i].data) free(sclip[i].data);
   }
   if (bclip.data) free(bclip.data);
   free_incrs();
   xcb_disconnect(xcb);
   return EXIT_SUCCESS;

xcb_fail:
   ERR("XCB connection failed");
   goto fail;
lock_fail:
   ERR("%s is already running.", basename(argv[0]));
fail:
   xcb_disconnect(xcb);
   return EXIT_FAILURE;
}

/* vim: set ts=8 sw=3 tw=0 :*/
