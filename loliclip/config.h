/* path to lock file */
#define LOCK_FILE    "/tmp/loliclip.pid"

/* dmenu mode character limit */
#define DMENU_LIMIT  230

/* zlib compression level */
#define ZLIB_LEVEL Z_BEST_SPEED

/* maximum request size until we INCR send it */
#define MAX_INCR UINT_MAX /* bytes */

/*  zlib compression? */
static char USE_ZLIB = 1;

/* clipboard post-process flags explained */
enum {
   CLIPBOARD_NONE = 0x00,
   CLIPBOARD_TRIM_WHITESPACE = 0x01,                /* trim trailing and leading whitespace */
   CLIPBOARD_TRIM_WHITESPACE_NO_MULTILINE = 0x02,   /* trim whitespace, if not multiline */
   CLIPBOARD_TRIM_TRAILING_NEWLINE = 0x04,          /* trim trailing newline */
   CLIPBOARD_OWN_IMMEDIATLY = 0x08,                 /* own clipboard immediatly after new data */
   CLIPBOARD_CLEAR_SELECTIONS = 0x1                 /* clear all special selections on copy.
                                                       this is how X applications expect the clipboard to behave */
};

/* registered clipboards and their settings
 * loliclip will only handle the registered clipboards
 *
 * arguments are following:
 * REGISTER_CLIPBOARD(
 *    clipboard name,
 *    name of clipboard you want to synchorize to,
 *    maximum allowed lenght for clipboard history,
 *    post-processing flags for new clipboard data
 * )
 *
 * Owning clipboard immediatly will give you the
 * post processed snippet immediatly, however
 * owning clipboard immediatly will cause the previous
 * owner to lose control of it (eg. PRIMARY selection disappears).
 *
 * So using that flag is not recommended for PRIMARY at least.
 *
 * Note that synced clipboards are owned when syncing happens,
 * you can notice this visually if you sync to PRIMARY for example,
 * so that the selection from application disappears.
 *
 */
clipdata clipboards[] = {
   REGISTER_CLIPBOARD("PRIMARY",   NULL, 0, CLIPBOARD_NONE),
   REGISTER_CLIPBOARD("SECONDARY", NULL, 0,
         CLIPBOARD_OWN_IMMEDIATLY),
   REGISTER_CLIPBOARD("CLIPBOARD", "PRIMARY", 150,
         CLIPBOARD_TRIM_WHITESPACE_NO_MULTILINE  |
         CLIPBOARD_TRIM_TRAILING_NEWLINE |
         CLIPBOARD_OWN_IMMEDIATLY),
};

/* registered special selections and their settings
 * loliclip will only handle the registered special selections
 *
 * arguments are following:
 * REGISTER_SELECTION(
 *    special selection name,
 *    shared binary data? (helps save ram, but selection is shared)
 * )
 *
 * I've included python script on the git repo that you can use
 * to get targets from different X applications, which loliclip treats
 * as "special selections".
 *
 * If ctrl-c isn't working in some application as expected when loliclip
 * is running, it's most like that the target isn't registered here.
 *
 * The data you get usually depends on application.
 * But most of the time the data is prioritized by the below list,
 * from top to bottom.
 *
 * On shared selections, the data is always replaced by the last
 * selection of data that is marked as shared.
 *
 * For example, if you copied image/tiff data,
 * and later image/jpeg, the image/tiff data would be replaced by,
 * the image/jpeg data.
 *
 * If the same application offers data in multiple formats that are
 * marked as shared in loliclip, then the data higher in the list
 * is prioritized for shared clipboard.
 *
 */
static specialclip sclip[] = {
   REGISTER_SELECTION("text/uri-list", 0),
   REGISTER_SELECTION("x-special/gnome-copied-files", 0),
   REGISTER_SELECTION("application/x-kde-cutselection", 0),
   REGISTER_SELECTION("image/png", 1),
   REGISTER_SELECTION("image/tiff", 1),
   REGISTER_SELECTION("image/jpeg", 1),
   REGISTER_SELECTION("image/x-bmp", 1),
   REGISTER_SELECTION("image/x-icon", 1),
   REGISTER_SELECTION("image/x-ico", 1),
   REGISTER_SELECTION("image/bmp", 1),
   REGISTER_SELECTION("image/x-win-bitmap", 1),
   REGISTER_SELECTION("image/x-MS-bmp", 1),
   REGISTER_SELECTION("text/plain", 0),
   REGISTER_SELECTION("text/richtext", 0),
   REGISTER_SELECTION("text/html", 0),
};

/* command sequence starter */
#define LOLICLIP_CMD_SEQ "#LC:"

/* bit flags for command sequence actions */
typedef enum clipflag {
   CLIP_NONE = 0x0,
   CLIP_SKIP_HISTORY = 0x1, /* skups clipboard history */
} clipflag;

/* commands and their assigned bits */
static cmdseq cmdseqs[] = {
   { "skip_history:", CLIP_SKIP_HISTORY }
};

/* example of command sequence:
 * #LC:skip_history:<clipboard text here>
 */

/* vim: set ts=8 sw=3 tw=0 :*/
