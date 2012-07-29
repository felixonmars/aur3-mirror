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

#define LENGTH(x) (sizeof(x)/sizeof(*x))
#define XCB_EVENT_RESPONSE_TYPE_MASK   (0x7f)
#define XCB_EVENT_RESPONSE_TYPE(e)     (e->response_type & XCB_EVENT_RESPONSE_TYPE_MASK)
#define STRNCMP(x,y) strncmp(x,y,strlen(y))

/* atom crap */
enum { PRIMARY, SECONDARY, CLIPBOARD, XSEL_DATA,
       UTF8_STRING, STRING, TIMESTAMP, TARGETS,
       INCR, MULTIPLE, DELETE, XNULL, TEXT,
       INTEGER, ATOM };
const char *natoms[] = {
   "PRIMARY",
   "SECONDARY",
   "CLIPBOARD",
   "XSEL_DATA",
   "UTF8_STRING",
   "STRING",
   "TIMESTAMP",
   "TARGETS",
   "INCR",
   "MULTIPLE",
   "DELETE",
   "NULL",
   "TEXT",
   "INTEGER",
   "ATOM"
};

/* supported targets */
const char *supported[] = {
   "UTF8_STRING",
   "TEXT",
   "NULL",
   "DELETE",
   "TIMESTAMP",
   //"INCR",
   //"MULTIPLE",
   "TARGETS"
};

/* actual atoms stored here */
static xcb_atom_t atoms[LENGTH(natoms)];
static xcb_atom_t satoms[LENGTH(supported)];

/* clipboard data struct */
typedef struct clipdata  {
   unsigned int sel;
   unsigned int sync;
   unsigned int maxclips;
   unsigned int flags;
   unsigned int cflags;
   unsigned int hash, ohash;
   size_t size;
   void *data;
   char selected;
   xcb_window_t owner;
} clipdata;

/* helper macros for registering clipboards */
#define REGISTER_CLIPBOARD(clipboard_to_handle, clipboard_to_sync, maxclips, flags) \
   { clipboard_to_handle, clipboard_to_sync, maxclips, flags, 0, 0, 0, 0, NULL, 0, XCB_NONE }
#define NO_SYNC XNULL

/* clipboard command sequences */
typedef enum clipflag {
   CLIP_NONE = 0x0,
   CLIP_SKIP_HISTORY = 0x1,
} clipflag;
typedef struct cmdseq {
   const char *cmd;
   clipflag flag;
} cmdseq;

/* load configuration */
#include "config.h"

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
REGISTER_ARG(arg_out);
REGISTER_ARG(arg_get);
REGISTER_ARG(arg_list);
REGISTER_ARG(arg_dmenu);
REGISTER_ARG(arg_clear);
REGISTER_ARG(arg_query);
#undef REGISTER_ARG

/* arguments are executed in order */
static cliparg clipargs[] = {
   { 0, 'd', "daemon",     0, arg_daemon,    NULL,                "Run as daemon." },
   { 0, 'p', "primary",    0, arg_primary,   arg_primary_sync,    "Operate on XA_PRIMARY." },
   { 0, 's', "secondary",  0, arg_secondary, arg_secondary_sync,  "Operate on XA_SECONDARY." },
   { 0, 'c', "clipboard",  0, arg_clipboard, arg_clipboard_sync,  "Operate on XA_CLIPBOARD." },
   { 0, 'o', "out",        0, arg_out,       NULL,                "\tGet clip from selection (not history)." },
   { 0, 'g', "get",        0, arg_get,       NULL,                "\tGet clip by index or hash form history." },
   { 0, 'l', "list",       0, arg_list,      NULL,                "\tLists clips from history." },
   { 0, 'm', "dmenu",      0, arg_dmenu,     NULL,                "\tDmenu friendly listing." },
   { 0, 'C', "clear",      0, arg_clear,     NULL,                "\tClears clipboard history." },
   { 0, 'q', "query",      0, arg_query,     NULL,                "\tQuery if loliclip daemon is running." }
};

/* xcb connection */
static xcb_connection_t *xcb;

/* hidden window */
static xcb_window_t xcbw;

/* xcb screen */
static xcb_screen_t *xcb_screen;

/* timeout to xcb wait calls */
static int xcb_timeout = 1;

/* timeout to xcb loop blocking, when we don't
 * own all the clipboards. */
static int xcb_timeout_loop = 25000 * 10;

/* X timestamp of first request */
static xcb_time_t xcb_timestamp = 0;

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
int zdecompress(FILE *s, FILE *d)
{
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
   for (s = buffer+len-1; *s && (isspace(*s) || *s == '\n'); --s)
      if (*s == '\n') hasnl = trail; else ++trail;

   if (len<=trail+lead)
      return NULL;

   *nlen = len-trail-lead+(hasnl?1:0);
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
      if (ml && buffer[i] != '\n') return 1;
      if (buffer[i] == '\n') ml = 1;
   }
   return 0;
}

/* set_clipboard_data uses this function */
static int set_clipboard_own(clipdata *c);

/* assign new clipboard data
 * return 1 == success
 * return 0 == fail */
static int set_clipboard_data(clipdata *c, char *buffer, size_t len) {
   char *s, *copy = NULL; size_t nlen, i;
   unsigned int flags = 0;

   if (c->flags & CLIPBOARD_OWN_IMMEDIATLY)
      set_clipboard_own(c);

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
      for (s = copy+len-1; *s && *s == '\n'; --s) {
         --len; *s = 0;
      }
      if (!*copy) goto fail;
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
   clipfile   = c->sel==PRIMARY?"XA_PRIMARY":
                c->sel==SECONDARY?"XA_SECONDARY":
                c->sel==CLIPBOARD?"XA_CLIPBOARD":NULL;
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
      unsigned int hash, unsigned int index)
{
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
      unsigned int hash, unsigned int index)
{
   size_t i;
   for (i = 0; i != blen; ++i)
      printf("%c", buffer[i]);
   if (rlen+blen == size) puts("");
   return 1;
}

/* get callback for ls */
static int ls_get(void *calldata, clipdata *c,
      const char *buffer, size_t blen, size_t rlen, size_t size,
      unsigned int hash, unsigned int index)
{
   unsigned int arg = *(unsigned int*)calldata;
   if (index != arg && hash != arg) return 1;
   return ls_puts(calldata, c, buffer, blen, rlen, size, hash, index);
}

/* restore clipboard data */
static int restore_clipboard(void *calldata, clipdata *c,
      const char *buffer, size_t blen, size_t rlen, size_t size,
      unsigned int hash, unsigned int index)
{
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

   OUT("\2Storing to \4%s\5\n%s", c->sel==PRIMARY?"PRIMARY":
                                  c->sel==SECONDARY?"SECONDARY":
                                  c->sel==CLIPBOARD?"CLIPBOARD":"UNKNOWN",
                                  (char*)c->data);
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
static xcb_generic_event_t* _xcb_get_last_event(uint8_t type) {
   xcb_generic_event_t *ev, *tev = NULL;
   while ((ev = xcb_poll_for_event(xcb))) {
      if (XCB_EVENT_RESPONSE_TYPE(ev) == type) tev = ev;
      else free(ev);
   }
   return tev;
}

/* timed blocking X single event wait */
static xcb_generic_event_t* _xcb_wait_for_single_event(unsigned int seconds, unsigned int nanoseconds, uint8_t type) {
   int ret; fd_set fds;
   unsigned int xfd;
   struct timeval timeout;
   xcb_generic_event_t *ev;

   if ((ev = _xcb_get_last_event(type)))
      return ev;
   xcb_flush(xcb);

   timeout.tv_sec  = seconds; timeout.tv_usec = nanoseconds;
   xfd = xcb_get_file_descriptor(xcb);
   FD_ZERO(&fds); FD_SET(xfd, &fds);
   if ((ret = select(xfd+1, &fds, 0, 0, &timeout)) == -1)
      return NULL;
   return _xcb_get_last_event(type);
}

/* timed blockin X event wait */
static xcb_generic_event_t* _xcb_wait_for_event(unsigned int seconds, unsigned int nanoseconds) {
   int ret; fd_set fds;
   unsigned int xfd;
   struct timeval timeout;
   xcb_generic_event_t *ev;

   if ((ev = xcb_poll_for_event(xcb)))
      return ev;
   xcb_flush(xcb);

   timeout.tv_sec  = seconds; timeout.tv_usec = nanoseconds;
   xfd = xcb_get_file_descriptor(xcb);
   FD_ZERO(&fds); FD_SET(xfd, &fds);
   if ((ret = select(xfd+1, &fds, 0, 0, &timeout)) == -1)
      return NULL;
   return xcb_poll_for_event(xcb);
}

/* check if we handle this selection */
static int we_handle_selection(xcb_atom_t selection) {
   int i;
   for (i = 0; i != LENGTH(clipboards); ++i)
      if (atoms[clipboards[i].sel] == selection)
         return i;
   return -1;
}

/* get owner for selection */
static xcb_atom_t get_owner_for_selection(xcb_atom_t selection) {
   xcb_get_selection_owner_reply_t *reply;
   xcb_atom_t owner;

   reply = xcb_get_selection_owner_reply(xcb,
         xcb_get_selection_owner(xcb, selection), NULL);
   if ((owner = reply->owner))
      OUT("\3%s owner is: 0x%x", selection==atoms[PRIMARY]?"PRIMARY":
                                 selection==atoms[SECONDARY]?"SECONDARY":
                                 selection==atoms[CLIPBOARD]?"CLIPBOARD":"NONE",
                                 owner);
   free(reply);
   return owner;
}

/* set support for atom for the TARGETS request */
static void set_support(const char *name, xcb_atom_t atom) {
   unsigned int i = 0;
   for (i = 0; i != LENGTH(supported); ++i)
      if (!strcmp(name, supported[i])) {
         OUT("support: %s", name);
         satoms[i] = atom;
         return;
      }
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
   OUT("\3Taking ownership of %s", selection==atoms[PRIMARY]?"PRIMARY":
                                   selection==atoms[SECONDARY]?"SECONDARY":
                                   selection==atoms[CLIPBOARD]?"CLIPBOARD":"NONE");
   xcb_set_selection_owner(xcb, xcbw, selection, XCB_CURRENT_TIME);
   owner = xcb_get_selection_owner_reply(xcb,
         xcb_get_selection_owner(xcb, selection), NULL);
   if (!owner || owner->owner != xcbw) ret = 0;
   if (owner) free(owner);
   return ret;
}

/* set clipboard ownership */
static int set_clipboard_own(clipdata *c) {
   char *path; int rindex = 0;
   if (c->owner == xcbw) return 1;
   if (set_own(atoms[c->sel])) {
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
   if (set_clear(atoms[c->sel])) c->owner = XCB_NONE;
   return c->owner!=xcbw;
}

/* init X selection/clipboard mess */
static void init_clipboard_protocol(void) {
   unsigned int i = 0; int c;
   xcb_intern_atom_reply_t *reply;
   xcb_intern_atom_cookie_t cookies[LENGTH(natoms)];

   memset(atoms, XCB_NONE, LENGTH(atoms));
   memset(satoms, XCB_NONE, LENGTH(satoms));
   for (i = 0; i != LENGTH(natoms); ++i)
      cookies[i] = xcb_intern_atom(xcb, 0, strlen(natoms[i]), natoms[i]);
   for (i = 0; i != LENGTH(natoms); ++i) {
      if ((reply = xcb_intern_atom_reply(xcb, cookies[i], NULL))) {
         atoms[i] = reply->atom;

         if ((c = we_handle_selection(atoms[i])) != -1) {
            if (!(clipboards[c].owner = get_owner_for_selection(atoms[i])))
               if (!set_clipboard_own(&clipboards[c]))
                  ERR("Failed to take ownership for %s", natoms[i]);
         }

         set_support(natoms[i], atoms[i]);
         OUT("%s = 0x%x", natoms[i], atoms[i]);
         free(reply);
      }
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
static void handle_incr(xcb_selection_notify_event_t *e) {
   xcb_property_notify_event_t *ev;

   /* start */
   OUT("Start waiting for INCR");
   xcb_change_window_attributes_checked(xcb, e->requestor, XCB_CW_EVENT_MASK, &(unsigned int){XCB_EVENT_MASK_PROPERTY_CHANGE|XCB_EVENT_MASK_STRUCTURE_NOTIFY});
   xcb_delete_property(xcb, e->requestor, e->property);
   while ((ev = (xcb_property_notify_event_t*)_xcb_wait_for_single_event(xcb_timeout, 0, XCB_PROPERTY_NOTIFY))) {
      if (ev->state != XCB_PROPERTY_NEW_VALUE) continue;
      OUT("GOT INCR!");
   }

   /* finish */
   //xcb_change_property(xcb, XCB_PROP_MODE_REPLACE, e->requestor, e->property, atoms[XNULL], 0, 0, NULL);
   xcb_delete_property(xcb, e->requestor, e->property);
}

/* fetch selection from selection notify event */
static char* fetch_xsel(xcb_window_t win, xcb_atom_t property, xcb_atom_t type, size_t *len) {
   xcb_get_property_reply_t *xsel = NULL;
   void *data; char *string = NULL; *len = 0;

   if (!property) return NULL;
   if (!(xsel = xcb_get_property_reply(xcb, xcb_get_property_unchecked(xcb, 0,
            win, property, type, 0, UINT32_MAX), 0)))
      return NULL;
   data = xcb_get_property_value(xsel);
   if (!(*len = xcb_get_property_value_length(xsel)))
      return NULL;
   if (!(string = malloc(*len+1))) return NULL;
   memcpy(string, data, *len); string[*len] = 0; free(xsel);
   xcb_delete_property(xcb, win, property);
   return string;
}

/* send X selection */
static void send_xsel(xcb_window_t requestor, xcb_atom_t property, xcb_atom_t selection,
      xcb_atom_t target, xcb_time_t time, size_t size, void *data) {

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

   if (target == atoms[UTF8_STRING])
      xcb_change_property(xcb, XCB_PROP_MODE_REPLACE, ev.requestor, ev.property,
            atoms[UTF8_STRING], 8, size, data);
   else if (target == atoms[STRING] || target == atoms[TEXT])
      xcb_change_property(xcb, XCB_PROP_MODE_REPLACE, ev.requestor, ev.property,
            atoms[STRING], 8, size, data);
   else if (target == atoms[TIMESTAMP])
      xcb_change_property(xcb, XCB_PROP_MODE_REPLACE, ev.requestor, ev.property,
            atoms[INTEGER], 32, 1, (unsigned char*)&ev.time);
   else if (target == atoms[DELETE])
      xcb_change_property(xcb, XCB_PROP_MODE_REPLACE, ev.requestor, ev.property,
            atoms[XNULL], 0, 0, NULL);
   else if (target == atoms[TARGETS])
      xcb_change_property(xcb, XCB_PROP_MODE_REPLACE, ev.requestor, ev.property,
            atoms[ATOM], 32, LENGTH(satoms), satoms);
   else if (target == atoms[INCR])
      handle_incr(&ev);
   else {
      OUT("Crap property");
      ev.property = XCB_NONE;
   }

   OUT("SENT: %s [%zu]", (char*)data, size);
   xcb_send_event(xcb, 0, ev.requestor, XCB_EVENT_MASK_NO_EVENT, (char*)&ev);
   xcb_flush(xcb);
}

/* request selection from X */
static char* get_xsel(xcb_atom_t selection, size_t *len) {
   xcb_generic_event_t *ev = NULL; char *string = NULL;
   xcb_selection_notify_event_t *e;

   OUT("\3Requesting selection from X");
   xcb_convert_selection(xcb, xcbw, selection,
         atoms[UTF8_STRING], atoms[XSEL_DATA], XCB_CURRENT_TIME);

   while ((ev = _xcb_wait_for_single_event(0, xcb_timeout_loop, XCB_SELECTION_NOTIFY))) {
      e = (xcb_selection_notify_event_t*)ev;
      xcb_change_window_attributes_checked(xcb, e->requestor, XCB_CW_EVENT_MASK,
            &(unsigned int){XCB_EVENT_MASK_PROPERTY_CHANGE});
      string = fetch_xsel(e->requestor, e->property, atoms[UTF8_STRING], len);
      free(ev);
   }

#if 0
   /* try INCR */
   if (!string) {
      xcb_convert_selection(xcb, xcbw, selection,
            atoms[INCR], atoms[XSEL_DATA], XCB_CURRENT_TIME);

      while ((ev = _xcb_wait_for_single_event(xcb_timeout, 0, XCB_SELECTION_NOTIFY))) {
         e = (xcb_selection_notify_event_t*)ev;
         OUT("\3Got INCR selection");
         handle_incr(e);
         OUT("INCR(%zu)", len);
         free(ev);
      }
   }
#endif

   if (!string) OUT("\3Failed to get selection from X");
   return string;
}

/* set X selection (blocks until clipboard is taken) */
static int set_xsel(xcb_atom_t selection, void *buffer, size_t len) {
   xcb_generic_event_t *ev = NULL;
   xcb_selection_clear_event_t *sc;
   xcb_selection_request_event_t *sr;

   OUT("\3Setting selection to X and blocking until it's taken");
   if (!set_own(selection)) return 0;
   while ((ev = xcb_wait_for_event(xcb))) {
      if (XCB_EVENT_RESPONSE_TYPE(ev) == XCB_SELECTION_CLEAR) {
         sc = (xcb_selection_clear_event_t*)ev;
         OUT("xcb: clear request");
         if (sc->selection == selection) break;
      } else if (XCB_EVENT_RESPONSE_TYPE(ev) == XCB_SELECTION_REQUEST) {
         sr = (xcb_selection_request_event_t*)ev;
         OUT("xcb: selection request");
         send_xsel(sr->requestor, sr->property, sr->selection,
               sr->target, sr->time, len, buffer);
      }
      free(ev);
   }
   if (ev) free(ev);
   return 1;
}

/* sync clipboard if it has syncs */
static void sync_clip(clipdata *c) {
   int sc;

   if (c->sync == NO_SYNC || c->sync == c->sel ||
     (sc = we_handle_selection(atoms[c->sync])) == -1)
     return;

  set_clipboard_data(&clipboards[sc], (char*)c->data, c->size);
  set_clipboard_own(&clipboards[sc]);
  OUT("Synced from 0x%x to 0x%x", atoms[c->sel], atoms[c->sync]);
}

/* handle selection request */
static void handle_request(xcb_selection_request_event_t *e) {
   int c; char *data = NULL; size_t size = 0;

   OUT("\3xcb: selection request");
   if ((c = we_handle_selection(e->selection)) != -1) {
      data = clipboards[c].data;
      size = clipboards[c].size;
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

#if 0
   OUT("hashed: %s", b);
   OUT("size: %zu", len);
   OUT("hash: %u", hash);
#endif
   return hash;
}

/* handle copying */
static void handle_copy(clipdata *c) {
   char *buffer = NULL; size_t len = 0;
   unsigned int hash = 0, changed;
   static unsigned int fail_xsel = 0;

   if (c->owner == XCB_NONE &&
      (c->owner = get_owner_for_selection(atoms[c->sel])) == XCB_NONE) {
      set_clipboard_own(c);
      return;
   }

#if 0
   xcb_query_tree_reply_t *query;
   xcb_window_t *w;
   char found;
   unsigned int i;
   if (c->owner != xcbw &&
      (query = xcb_query_tree_reply(xcb, xcb_query_tree(xcb, xcb_screen->root), 0))) {
      w = xcb_query_tree_children(query); found = 0;
      OUT("Searching");
      for (i = 0; i != query->children_len; ++i)
         if (w[i] == c->owner) found = 1;
      free(query);
      if (!found) {
         set_clipboard_own(c);
         return;
      }
   }
#endif

   if (!(buffer = get_xsel(atoms[c->sel], &len)) || !len) {
      if (++fail_xsel==2) {
         set_clipboard_own(c);
         fail_xsel = 0;
      }
      return;
   }
   fail_xsel = 0;

   /* can we copy the data immediatly? or do we need to
    * let go can wait until copy is done.
    *
    * this is only neccessary to PRIMARY, so that the
    * history won't get bloated with non full selections. */
   if (c->sel == PRIMARY) {
      if ((hash = hashb(buffer, len)) != c->ohash) {
         OUT("\4Start of PRIMARY copy");
         c->ohash = hash; free(buffer); return;
      } else {
         if (c->hash == c->ohash) {
            free(buffer); return;
         }
         OUT("\4End of PRIMARY copy");
      }
   } else {
      OUT("\4Got data from some other clipboard");
      if (c->ohash == (hash = hashb(buffer, len))) {
         free(buffer);

         /* should own immediatly? */
         if (c->flags & CLIPBOARD_OWN_IMMEDIATLY) {
            set_clipboard_own(c);
            sync_clip(c);
         }

         return;
      }
      c->ohash = hash;
   }

   changed = set_clipboard_data(c, buffer, len);
   free(buffer); c->hash = hashb(c->data, c->size);
   if (!changed || (c->hash == hash && c->ohash != c->hash)) {
      /* should own immediatly? */
      if (c->flags & CLIPBOARD_OWN_IMMEDIATLY) {
         set_clipboard_own(c);
         sync_clip(c);
      }
      return;
   }

   /* sync and maybe store? */
   sync_clip(c);
   if (!(c->cflags & CLIP_SKIP_HISTORY) && c->maxclips > 0)
      store_clip(c);
}

/* handle clear request */
static void handle_clear(xcb_selection_clear_event_t *e) {
   int c;

   OUT("\3xcb: clear request");
   if ((c = we_handle_selection(e->selection)) == -1)
      return;

   /* don't do it */
   if (clipboards[c].flags == CLIPBOARD_TRIM_TRAILING_NEWLINE) {
      set_clipboard_own(&clipboards[c]);
      return;
   }

   /* don't let go of other clipboards */
   clipboards[c].owner = XCB_NONE;
}

/* handle property notify */
static void handle_property(xcb_property_notify_event_t *e) {
   if (e->state != XCB_PROPERTY_DELETE) return;
   OUT("\1PROPERTY DELETE");
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
   tm.tv_sec   = 3;
   tm.tv_usec  = 0;
   return select(fd+1, &fdset, NULL, NULL, &tm)==1?1:0;
}

/* parse data as CLI argument */
static char* get_data_as_argument(int argc, char **argv) {
   char buffer[1024], *data = NULL, *tmp;
   size_t size = 0, read; int i;

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

#define FUNC_ARG(x) static int x(int argc, char **argv)
FUNC_ARG(arg_daemon) {
   OUT("\2Daemonize");
   if (!check_lock(1)) return 0;
   if (daemon(0, 0) != 0) ERR("\1Failed to become a daemon");
   return 0;
}

FUNC_ARG(arg_primary) {
   int c = 0;
   OUT("\4PRIMARY selected");
   if ((c = we_handle_selection(atoms[PRIMARY])) == -1)
      goto fail;
   clipboards[c].selected = 1;
   return 1;
fail:
   ERR("XA_PRIMARY isn't a registered clipboard.");
   return -1;
}

FUNC_ARG(arg_primary_sync) {
   char *data;
   OUT("\4Sync PRIMARY");
   if ((data = get_data_as_argument(argc, argv))) {
      OUT("\2data: %s", data);
      if (daemon(0, 0) != 0) {
         ERR("\1Failed to become a daemon");
         return -1;
      }
      set_xsel(atoms[PRIMARY], data, strlen(data));
      free(data);
   }
   return 1;
}

FUNC_ARG(arg_secondary) {
   int c = 0;
   OUT("\4SECONDARY selected");
   if ((c = we_handle_selection(atoms[SECONDARY])) == -1)
      goto fail;
   clipboards[c].selected = 1;
   return 1;
fail:
   ERR("XA_SECONDARY isn't a registered clipboard.");
   return -1;
}

FUNC_ARG(arg_secondary_sync) {
   char *data;
   OUT("\4Sync SECONDARY");
   if ((data = get_data_as_argument(argc, argv))) {
      OUT("\2data: %s", data);
      if (daemon(0, 0) != 0) {
         ERR("\1Failed to become a daemon");
         return -1;
      }
      set_xsel(atoms[SECONDARY], data, strlen(data));
      free(data);
   }
   return 1;
}

FUNC_ARG(arg_clipboard) {
   int c = 0;
   OUT("\4CLIPBOARD selected");
   if ((c = we_handle_selection(atoms[CLIPBOARD])) == -1)
      goto fail;
   clipboards[c].selected = 1;
   return 1;
fail:
   ERR("XA_CLIPBOARD isn't a registered clipboard.");
   return -1;
}

FUNC_ARG(arg_clipboard_sync) {
   char *data;
   OUT("\4Sync CLIPBOARD");
   if ((data = get_data_as_argument(argc, argv))) {
      OUT("\2data: %s", data);
      if (daemon(0, 0) != 0) {
         ERR("\1Failed to become a daemon");
         return -1;
      }
      set_xsel(atoms[CLIPBOARD], data, strlen(data));
      free(data);
   }
   return 1;
}

FUNC_ARG(arg_out) {
   int o; char lsall = 1, *buffer; size_t len;

   OUT("\4Getting from X selection");
   for (o = 0; o != LENGTH(clipboards); ++o)
      if (clipboards[o].selected) lsall = 0;

   for (o = 0; o != LENGTH(clipboards); ++o) {
      if ((lsall || clipboards[o].selected) &&
         (buffer = get_xsel(atoms[clipboards[o].sel], &len)) && len) {
         printf("%s\n", buffer);
         free(buffer);
      }
   }
   return 1;
}

FUNC_ARG(arg_get) {
   int o; char lsall = 1, *path, *data;
   unsigned int arg;

   OUT("\4Getting from history");
   if (!(data = get_data_as_argument(argc, argv)))
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
      if (clipargs[o].atarg) {
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
   unsigned int i = 0, doblock = 0; int skiploop = 0;

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
   }
   while (!skiploop && RUN && !xcb_connection_has_error(xcb)) {
      if (doblock) ev = xcb_wait_for_event(xcb);
      while (doblock || (ev = _xcb_wait_for_event(0, xcb_timeout_loop))) {
         if (XCB_EVENT_RESPONSE_TYPE(ev) == XCB_SELECTION_REQUEST)
            handle_request((xcb_selection_request_event_t*)ev);
         else if (XCB_EVENT_RESPONSE_TYPE(ev) == XCB_SELECTION_CLEAR)
            handle_clear((xcb_selection_clear_event_t*)ev);
//         else if (XCB_EVENT_RESPONSE_TYPE(ev) == XCB_PROPERTY_NOTIFY)
//            handle_property((xcb_property_notify_event_t*)ev);
#ifdef XCB_UTIL
         else OUT("\3xcb: \1unhandled event '\5%s\1'", xcb_event_get_label(ev->response_type));
#else
         else OUT("\3xcb: \1unhandled event");
#endif
         free(ev); if (doblock) break;
      }

      doblock = 1;
      for (i = 0; i != LENGTH(clipboards); ++i) {
         if (clipboards[i].owner == xcbw) continue;
         handle_copy(&clipboards[i]); doblock = 0;
      }
   }

   OUT("\1Stopping loliclip");
   for (i = 0; i != LENGTH(clipboards); ++i) {
      if (clipboards[i].owner == xcbw) set_clipboard_clear(&clipboards[i]);
      if (clipboards[i].data) free(clipboards[i].data);
   }
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
