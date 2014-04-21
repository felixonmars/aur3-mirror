/*
    (c) 2009 by Leon Winter
    (c) 2009-2012 by Hannes Schueller
    (c) 2009-2010 by Matto Fransen
    (c) 2010-2011 by Hans-Peter Deifel
    (c) 2010-2011 by Thomas Adam
    (c) 2011 by Albert Kim
    (c) 2013 Daniel Carl
    see LICENSE file
*/

/* Vimprobable version number */
#define VERSION "1.4.2"
#define INTERNAL_VERSION "Vimprobable2/"VERSION

extern Client client;

/* general settings */
char startpage[MAX_SETTING_SIZE]        = "https://bbs.archlinux.org/";
char useragent[MAX_SETTING_SIZE]        = "Vimprobable2/" VERSION;
char acceptlanguage[MAX_SETTING_SIZE]   = "";
static const gboolean enablePlugins     = TRUE; /* TRUE keeps plugins enabled */
static const gboolean enableJava        = TRUE; /* FALSE disables Java applets */
static const gboolean enablePagecache   = FALSE; /* TRUE turns on the page cache. */
static gboolean escape_input_on_load    = TRUE; /* TRUE will disable automatic focusing of input fields via Javascript*/
char temp_dir[MAX_SETTING_SIZE]         = "/tmp"; /* location of temporary files, default will be overridden if TEMPDIR is set */

char downloads_path[MAX_SETTING_SIZE]   = "";
char statusfont[MAX_SETTING_SIZE]       = "DejaVu Sans 7";      /* font for status bar */

/* appearance */
char statusbgcolor[MAX_SETTING_SIZE]    = "#222222";            /* background color for status bar */
char statuscolor[MAX_SETTING_SIZE]      = "#696969";            /* color for status bar */
char sslbgcolor[MAX_SETTING_SIZE]       = "#222222";            /* background color for status bar with SSL url */
char sslinvalidbgcolor[MAX_SETTING_SIZE]= "#8A2F58";            /* background color for status bar with unverified SSL url */
char sslcolor[MAX_SETTING_SIZE]         = "#53A6A6";            /* color for status bar with SSL url */

                                        /*  normal,             warning,           error       */
char urlboxfont[][MAX_SETTING_SIZE]     = { "DejaVu Sans 7",   "DejaVu Sans 7",   "DejaVu Sans 7"};
static const char *urlboxcolor[]        = { "#CCCCCC",          "#CC99CC",        "#FFB6C1" };
static const char *urlboxbgcolor[]      = { "#212121",          "#111111",        "#212121" };

                                        /*  normal,                          error               */
char completionfont[2][MAX_SETTING_SIZE] = { "DejaVu Sans 7",   "DejaVu Sans 7" };
                                                                                        /* topborder color */
static const char *completioncolor[]    = { "#899CA1",          "#BF4D80",              "#444444" };
                                                                                        /* current row background */
static const char *completionbgcolor[]  = { "#3D3D3D",          "#8C4665",              "#5C5C5C" };

/* pango markup for prefix highliting:      opening,                closing             */
#define             COMPLETION_TAG_OPEN     "<b>"
#define             COMPLETION_TAG_CLOSE    "</b>"

#define             ENABLE_HISTORY_INDICATOR
#define             ENABLE_INCREMENTAL_SEARCH
#define             ENABLE_GTK_PROGRESS_BAR
#define             ENABLE_WGET_PROGRESS_BAR
static const int progressbartick        = 20;
static const char progressborderleft    = '[';
static const char progressbartickchar   = ':';
static const char progressbarcurrent    = ':';
static const char progressbarspacer     = ' ';
static const char progressborderright   = ']';

/* external handlers:
 * the handle (first string) contain what the handled links have to start with
 * the handlers (second string) contain the external applications which should be called for this sort of link
 *    %s can be used as a placeholder for the link argument after the handler
 *    e.g.: "mailto:user@example.org
 *       "handle" is "mailto:"
 *       "%s" will translate to "user@example.org"
 */
static URIHandler uri_handlers[] = {
    { "mailto:",          "urxvtc -e mutt %s" },
    { "ftp://",           "urxvtc -e wget ftp://%s" },
    { "vimprobableedit:", "urxvt -title scratchpad -geometry 86x24+40+60 -e vim %s" },
};

/* cookies */
#define             ENABLE_COOKIE_SUPPORT
#define             COOKIES_STORAGE_FILENAME    "%s/vimprobable/cookies", client.config.config_base
#define             COOKIES_STORAGE_READONLY    FALSE   /* if TRUE new cookies will be lost if you quit */
SoupCookieJarAcceptPolicy CookiePolicy = SOUP_COOKIE_JAR_ACCEPT_ALWAYS; /* by default, accept all cookies */


/* font size */
#define             DEFAULT_FONT_SIZE           10

/* user styles */
#define             USER_STYLESHEET             "%s/vimprobable/style.css", client.config.config_base

/* user javascript */
#define             ENABLE_USER_SCRIPTFILE
#define             USER_SCRIPTFILE             "%s/vimprobable/scripts.js", client.config.config_base

/* ssl */
static gboolean strict_ssl              = TRUE; /* FALSE will accept any SSL certificate at face value */
static char ca_bundle[MAX_SETTING_SIZE] = "/etc/ssl/certs/ca-certificates.crt";

/* proxy */
static const gboolean use_proxy         = FALSE; /* TRUE if you're going to use a proxy (whose address
                                                  is specified in http_proxy environment variable), false otherwise */
/* scrolling */
static unsigned int scrollstep          = 40;   /* cursor difference in pixel */
static unsigned int pagingkeep          = 40;   /* pixels kept when paging */
#define             DISABLE_SCROLLBAR

/* searching */
#define             ENABLE_MATCH_HIGHLITING
static const int searchoptions          = CaseInsensitive | Wrapping;
gboolean complete_case_sensitive        = TRUE;

/* search engines */
static Searchengine searchengines[] = {
    { "d",         "https://duckduckgo.com/html/?q=%s&t=Vimprobable" },
    { "g",         "https://ixquick.com/do/metasearch.pl?language=english&cat=web&query=%s" },
    { "b",         "https://ixquick.com/do/metasearch.pl?&cat=web&query=host:bbs.archlinux.org+%s" },
    { "a",         "https://wiki.archlinux.org/index.php?title=Special%%3ASearch&search=%s&go=Go" },
    { "w",         "https://secure.wikimedia.org/wikipedia/en/w/index.php?title=Special%%3ASearch&search=%s&go=Go" },
    /* Hack to shorten urls */
    { "B",         "https://api-ssl.bitly.com/v3/shorten?access_token=20e9827b9c5ddee1b0cec7722bfc557dec833791&longUrl=%s&format=txt" },
};

static char defaultsearch[MAX_SETTING_SIZE] = "d";

/* command mapping */
Command commands[COMMANDSIZE] = {
    /* command,                                        function,         argument */
    { "ba",                                            navigate,         {NavigationBack} },
    { "back",                                          navigate,         {NavigationBack} },
    { "ec",                                            script,           {Info} },
    { "echo",                                          script,           {Info} },
    { "echoe",                                         script,           {Error} },
    { "echoerr",                                       script,           {Error} },
    { "fw",                                            navigate,         {NavigationForward} },
    { "fo",                                            navigate,         {NavigationForward} },
    { "forward",                                       navigate,         {NavigationForward} },
    { "javascript",                                    script,           {Silent} },
    { "o",                                             open_arg,         {TargetCurrent} },
    { "open",                                          open_arg,         {TargetCurrent} },
    { "q",                                             quit,             {0} },
    { "quit",                                          quit,             {0} },
    { "re",                                            navigate,         {NavigationReload} },
    { "re!",                                           navigate,         {NavigationForceReload} },
    { "reload",                                        navigate,         {NavigationReload} },
    { "reload!",                                       navigate,         {NavigationForceReload} },
    { "qt",                                            search_tag,       {0} },
    { "st",                                            navigate,         {NavigationCancel} },
    { "stop",                                          navigate,         {NavigationCancel} },
    { "t",                                             open_arg,         {TargetNew} },
    { "tabopen",                                       open_arg,         {TargetNew} },
    { "print",                                         print_frame,      {0} },
    { "ha",                                            print_frame,      {0} },
    { "bma",                                           bookmark,         {0} },
    { "bookmark",                                      bookmark,         {0} },
    { "source",                                        view_source,      {0} },
    { "openeditor",                                    open_editor,      {0} },
    { "set",                                           browser_settings, {0} },
    { "map",                                           mappings,         {0} },
    { "inspect",                                       open_inspector,   {0} },
    { "jumpleft",                                      scroll,           {ScrollJumpTo   | DirectionLeft} },
    { "jumpright",                                     scroll,           {ScrollJumpTo   | DirectionRight} },
    { "jumptop",                                       scroll,           {ScrollJumpTo   | DirectionTop} },
    { "jumpbottom",                                    scroll,           {ScrollJumpTo   | DirectionBottom} },
    { "pageup",                                        scroll,           {ScrollMove     | DirectionTop      | UnitPage} },
    { "pagedown",                                      scroll,           {ScrollMove     | DirectionBottom   | UnitPage} },
    { "navigationback",                                navigate,         {NavigationBack} },
    { "navigationforward",                             navigate,         {NavigationForward} },
    { "scrollleft",                                    scroll,           {ScrollMove     | DirectionLeft     | UnitLine} },
    { "scrollright",                                   scroll,           {ScrollMove     | DirectionRight    | UnitLine} },
    { "scrollup",                                      scroll,           {ScrollMove     | DirectionTop      | UnitLine} },
    { "scrolldown",                                    scroll,           {ScrollMove     | DirectionBottom   | UnitLine} },
    { "zi",                                            zoom,             {ZoomIn         | ZoomText} },
    { "zo",                                            zoom,             {ZoomOut        | ZoomText} },
    { "pgzi",                                          zoom,             {ZoomIn         | ZoomFullContent} },
    { "pgzo",                                          zoom,             {ZoomOut        | ZoomFullContent} },
};

/* mouse bindings
   you can use MOUSE_BUTTON_1 to MOUSE_BUTTON_5
*/
static Mouse mouse[] = {
    /* modmask,             modkey,         button,            function,        argument */
    { 0,                    0,              MOUSE_BUTTON_2,    paste,           {TargetCurrent  | ClipboardPrimary  | ClipboardGTK, client.state.rememberedURI} },
    { GDK_CONTROL_MASK,     0,              MOUSE_BUTTON_2,    paste,           {TargetNew  | ClipboardPrimary  | ClipboardGTK} },
    { GDK_CONTROL_MASK,     0,              MOUSE_BUTTON_1,    open_remembered, {TargetNew} },
};

/* settings (arguments of :set command) */
static Setting browsersettings[] = {
    /* public name,      internal variable   webkit setting                 integer value?  boolean value?   colour value?   reload page? */
    { "useragent",       useragent,          "user-agent",                  FALSE,          FALSE,           FALSE,          FALSE  },
    { "scripts",         NULL,               "enable-scripts",              FALSE,          TRUE,            FALSE,          FALSE  },
    { "plugins",         NULL,               "enable-plugins",              FALSE,          TRUE,            FALSE,          FALSE  },
    { "pagecache",       NULL,               "enable-page-cache",           FALSE,          TRUE,            FALSE,          FALSE  },
    { "java",            NULL,               "enable-java-applet",          FALSE,          TRUE,            FALSE,          FALSE  },
    { "images",          NULL,               "auto-load-images",            FALSE,          TRUE,            FALSE,          FALSE  },
    { "shrinkimages",    NULL,               "auto-shrink-images",          FALSE,          TRUE,            FALSE,          FALSE  },
    { "cursivefont",     NULL,               "cursive-font-family",         FALSE,          FALSE,           FALSE,          FALSE  },
    { "defaultencoding", NULL,               "default-encoding",            FALSE,          FALSE,           FALSE,          FALSE  },
    { "defaultfont",     NULL,               "default-font-family",         FALSE,          FALSE,           FALSE,          FALSE  },
    { "fontsize",        NULL,               "default-font-size",           TRUE,           FALSE,           FALSE,          FALSE  },
    { "monofontsize",    NULL,               "default-monospace-font-size", TRUE,           FALSE,           FALSE,          FALSE  },
    { "caret",           NULL,               "enable-caret-browsing",       FALSE,          TRUE,            FALSE,          FALSE  },
    { "fantasyfont",     NULL,               "fantasy-font-family",         FALSE,          FALSE,           FALSE,          FALSE  },
    { "minimumfontsize", NULL,               "minimum-font-size",           TRUE,           FALSE,           FALSE,          FALSE  },
    { "monofont",        NULL,               "monospace-font-family",       FALSE,          FALSE,           FALSE,          FALSE  },
    { "backgrounds",     NULL,               "print-backgrounds",           FALSE,          TRUE,            FALSE,          FALSE  },
    { "sansfont",        NULL,               "sans-serif-font-family",      FALSE,          FALSE,           FALSE,          FALSE  },
    { "seriffont",       NULL,               "serif-font-family",           FALSE,          FALSE,           FALSE,          FALSE  },
    { "stylesheet",      NULL,               "user-stylesheet-uri",         FALSE,          FALSE,           FALSE,          FALSE  },
    { "resizetextareas", NULL,               "resizable-text-areas",        FALSE,          TRUE,            FALSE,          FALSE  },
    { "webinspector",    NULL,               "enable-developer-extras",     FALSE,          TRUE,            FALSE,          FALSE  },

    { "homepage",        startpage,          "",                            FALSE,          FALSE,           FALSE,          FALSE  },
    { "statusbgcolor",   statusbgcolor,      "",                            FALSE,          FALSE,           TRUE,           TRUE   },
    { "statuscolor",     statuscolor,        "",                            FALSE,          FALSE,           TRUE,           TRUE   },
    { "sslbgcolor",      sslbgcolor,         "",                            FALSE,          FALSE,           TRUE,           TRUE   },
    { "sslcolor",        sslcolor,           "",                            FALSE,          FALSE,           TRUE,           TRUE   },
    { "acceptlanguage",  acceptlanguage,     "",                            FALSE,          FALSE,           FALSE,          FALSE  },
    { "defaultsearch",   defaultsearch,      "",                            FALSE,          FALSE,           FALSE,          FALSE  },
    { "cookies",         NULL,               "",                            FALSE,          FALSE,           FALSE,          FALSE  },
    { "downloadspath",   downloads_path,     "",                            FALSE,          FALSE,           FALSE,          FALSE  },
    { "statusfont",      statusfont,         "",                            FALSE,          FALSE,           FALSE,          FALSE  },
    { "urlboxfontnormal",urlboxfont[0],      "",                            FALSE,          FALSE,           FALSE,          FALSE  },
    { "urlboxfontwarning",urlboxfont[1],      "",                           FALSE,          FALSE,           FALSE,          FALSE  },
    { "urlboxfonterror", urlboxfont[2],      "",                            FALSE,          FALSE,           FALSE,          FALSE  },
    { "completionfontnormal", completionfont[0],      "",                   FALSE,          FALSE,           FALSE,          FALSE  },
    { "completionfonterror",  completionfont[1],      "",                   FALSE,          FALSE,           FALSE,          FALSE  },
    { "qmark",           NULL,               "",                            FALSE,          FALSE,           FALSE,          FALSE  },
    { "proxy",           NULL,               "",                            FALSE,          TRUE,            FALSE,          FALSE  },
    { "windowsize",      NULL,               "",                            FALSE,          FALSE,           FALSE,          FALSE  },
    { "scrollbars",      NULL,               "",                            FALSE,          TRUE,            FALSE,          FALSE  },
    { "statusbar",       NULL,               "",                            FALSE,          TRUE,            FALSE,          FALSE  },
    { "inputbox",        NULL,               "",                            FALSE,          TRUE,            FALSE,          FALSE  },
    { "completioncase",  NULL,               "",                            FALSE,          TRUE,            FALSE,          FALSE  },
    { "escapeinput",     NULL,               "",                           FALSE,          TRUE,            FALSE,          FALSE  },
    { "strictssl",       NULL,               "",                            FALSE,          TRUE,            FALSE,          FALSE  },
    { "cabundle",        ca_bundle,          "",                            FALSE,          FALSE,           FALSE,          FALSE  },
    { "tempdir",         temp_dir,           "",                            FALSE,          FALSE,           FALSE,          FALSE  },
};
