/* See LICENSE file for copyright and license details. */

/* William Giokas's dwm config.h
 * semi-i3 like keybinds, i3 colors
 * no border
 * top bar
 * a few pre-set windows
 */

/* appearance */
static const char font[]            = "-*-proggytinysz-medium-*-*-*-10-*-*-*-*-*-*-*";
static const char normbordercolor[] = "#333333";
static const char normbgcolor[]     = "#5f676a";
static const char normfgcolor[]     = "#cccccc";
static const char selbordercolor[]  = "#4c7899";
static const char selbgcolor[]      = "#285577";
static const char selfgcolor[]      = "#eeeeee";
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 16;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */

/* tagging                     0       1      2       3        4        5        6       7       8     */
static const char *tags[] = { "term", "web", "web2", "image", "comic", "video", "game", "misc", "hide" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Dwb",      NULL,       NULL,       1 << 1,       False,       -1 },
	{ "Gimp",     NULL,       NULL,       1 << 3,       False,       -1 },
	{ "URxvt",    NULL,       "download_dwb", 1 << 1,   True,        -1 },
	{ "luakit",   NULL,       NULL,       1 << 2,       False,       -1 },
	{ "Firefox",  NULL,       NULL,       1 << 2,       False,       -1 },
	{ "Mcomix",   NULL,       NULL,       1 << 4,       False,       -1 },
	{ "Steam",    NULL,       NULL,       1 << 6,       True,        -1 },
	{ "mplayer2", NULL,       NULL,       1 << 5,       True,        -1 },
};

/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Bool resizehints = True; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "<>-",      NULL },    /* no layout function means floating behavior */
	{ "(M)",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
/* dmenu */
static const char *dmenucmd[]    = { "dmenu_run", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
/* Spawning windows */
static const char *termcmd[]     = { "urxvtc", NULL };
static const char *dwbcmd[]      = { "systemctl", "--user", "start", "dwb@:0",    NULL};
static const char *luakitcmd[]   = { "systemctl", "--user", "start", "luakit@:0", NULL};
static const char *mcomixcmd[]   = { "systemctl", "--user", "start", "mcomix@:0", NULL};

/* Systemd --user stuff */
static const char *killcmd[]        = { "systemctl", "--user", "exit",                  NULL };
static const char *restartcmd[]     = { "systemctl", "--user", "restart", "dwm",        NULL };
static const char *barrestartcmd[]  = { "systemctl", "--user", "restart", "dwm-status", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_e,      spawn,          {.v = killcmd } },
	{ MODKEY|ShiftMask,             XK_r,      spawn,          {.v = restartcmd } },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_v,      togglebar,      {0} },
	{ MODKEY|ShiftMask,             XK_v,      spawn,          {.v = barrestartcmd } },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_u,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = -1 } },
    /* Resize main window left and right                                */
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
    /* Layout Keys:                                                     */
	{ MODKEY,                       XK_e,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_w,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_s,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
    /* Move window into master position                                 */
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
    /* See all tags                                                     */
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
    /* I think these 4 are broken...                                    */
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
    /* Systemd user unit hotkeys                                        */
    { MODKEY|ShiftMask,             XK_n,      spawn,          {.v = luakitcmd } },
    { MODKEY|ShiftMask,             XK_b,      spawn,          {.v = dwbcmd } },
    { MODKEY|ShiftMask,             XK_m,      spawn,          {.v = mcomixcmd } },
    /* Workspace Tags                                                   */
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
