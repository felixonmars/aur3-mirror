/* path to lock file */
#define LOCK_FILE    "/tmp/loliclip.pid"

/* dmenu mode character limit */
#define DMENU_LIMIT  230

/* zlib compression level */
#define ZLIB_LEVEL Z_BEST_SPEED

/*  zlib compression? */
static char USE_ZLIB = 1;

/* clipboard post-process flags explained */
enum {
   CLIPBOARD_NONE = 0x0,
   CLIPBOARD_TRIM_WHITESPACE = 0x1,                /* trim trailing and leading whitespace */
   CLIPBOARD_TRIM_WHITESPACE_NO_MULTILINE = 0x2,   /* trim whitespace, if not multiline */
   CLIPBOARD_TRIM_TRAILING_NEWLINE = 0x4,          /* trim trailing newline */
   CLIPBOARD_OWN_IMMEDIATLY = 0x8                  /* own clipboard immediatly after new data */
};

/* registered clipboards and their settings
 * loliclip will only handle the registered clipboards
 *
 * arguments are following:
 * REGISTER_CLIPBOARD(
 *    clipboard atom index,
 *    index to clipboard you want to sync with,
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
   REGISTER_CLIPBOARD(PRIMARY, NO_SYNC, 0, CLIPBOARD_NONE),
   REGISTER_CLIPBOARD(SECONDARY, NO_SYNC, 0, CLIPBOARD_NONE),
   REGISTER_CLIPBOARD(CLIPBOARD, PRIMARY, 15,
         CLIPBOARD_TRIM_WHITESPACE_NO_MULTILINE  |
         CLIPBOARD_TRIM_TRAILING_NEWLINE |
         CLIPBOARD_OWN_IMMEDIATLY),
};

/* command sequence starter */
#define LOLICLIP_CMD_SEQ "#LC:"

/* commands and their assigned bits
 *
 * CLIP_SKIP_HISTORY : skips clipboard history
 */
static cmdseq cmdseqs[] = {
   { "skip_history:", CLIP_SKIP_HISTORY }
};

/* example of command sequence:
 * #LC:skip_history:<clipboard text here>
 */

/* vim: set ts=8 sw=3 tw=0 :*/
