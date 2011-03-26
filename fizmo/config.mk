
# Please read "INSTALL.txt" before modifying these values.

CC = gcc
AR = ar
CFLAGS = -Wall -Wextra

# Change to "/usr" for sytem-wide install or "$(DESTDIR)/usr" when creating
# debian packages.
INSTALL_PREFIX = $(HOME)/opt/fizmo-0.6.4

# If defined, install goes to "$(INSTALL_PREFIX)/($FIZMO_BIN_DIR)" instead of
# "(INSTALL_PREFIX)/games" (usually use to subsitute "bin" for "games").
FIZMO_BIN_DIR = bin

DEFAULT_PREFIX = /usr
DEFAULT_LIB_PREFIX = $(DEFAULT_PREFIX)/lib
DEFAULT_INC_PREFIX = $(DEFAULT_PREFIX)/include

# The include and lib setting for the ncursesw library are mandatory.
NCURSESW_INC_DIR = $(DEFAULT_INC_PREFIX)
NCURSESW_LIB_DIR = $(DEFAULT_LIB_PREFIX)

# libxml2 is required for babel metadata.
#DISABLE_LIBXML2 = 1
LIBXML2_INC_DIR = $(DEFAULT_INC_PREFIX)/libxml2
LIBXML2_LIB_DIR = $(DEFAULT_LIB_PREFIX)

# Uncomment the following line and set the SDL_* variables to build an
# SDL-based sound-interface:
FIZMO_SOUND_INTERFACE = sound-sdl
SDL_INC_DIR = $(DEFAULT_INC_PREFIX)
SDL_LIB_DIR = $(DEFAULT_LIB_PREFIX)

# If you have libsndfile available, fizmo will be able to read AIFF from
# blorbs:
ENABLE_AIFF_FOR_SOUND_SDL = 1
SNDFILE_INC_DIR = $(DEFAULT_INC_PREFIX)
SNDFILE_LIB_DIR = $(DEFAULT_LIB_PREFIX)

# These variables have to be set in order to display X11 images in ncursesw:
ENABLE_X11_IMAGES = 1
X11_LIB_DIR = $(DEFAULT_PREFIX)/X11/lib
GLIB_CONFIG_INC_DIR = $(DEFAULT_LIB_PREFIX)/glib-2.0/include
GDK_CONFIG_INC_DIR = $(DEFAULT_LIB_PREFIX)/gtk-2.0/include
GLIB_INC_DIR = $(DEFAULT_INC_PREFIX)/glib-2.0
GTK_INC_DIR = $(DEFAULT_INC_PREFIX)/gtk-2.0
CAIRO_INC_DIR = $(DEFAULT_INC_PREFIX)/cairo
PANGO_INC_DIR = $(DEFAULT_INC_PREFIX)/pango-1.0
ATK_INC_DIR = $(DEFAULT_INC_PREFIX)/atk-1.0

# This adds an -O2 flag (usually okay):
ENABLE_OPTIMIZATION = 1

# If you're building a "dumb" interface like the CGI-interface (this
# runs the minizork-demo on the webpage, take a look at src/cgi) you
# may want to save memory and cpu by uncommenting the following lines:
#DISABLE_BLOCKBUFFER = 1
#DISABLE_COMMAND_HISTORY = 1
#DISABLE_OUTPUT_HISTORY = 1


# Debug-Flags:

# Uncomment to fill your harddisk _very_ fast:
#ENABLE_TRACING = 1

# Used for the strictz-test:
#ENABLE_STRICT_Z = 1

# Add GDB symbols, only useful for debuggong:
#ENABLE_GDB_SYMBOLS = 1

# Throws sigfault on error for emergency backtrace (usually never needed):
#THROW_SIGFAULT_ON_ERROR = 1

