# $Header: /home/jcb/MahJong/newmj/RCS/Makefile.in,v 12.1 2009/07/10 07:55:51 jcb Rel $
# Master makefile for the xmj suite.

### NOTE NOTE NOTE
### This makefile uses some features specific to GNU make.
### If you do not have GNU make, you will need to adjust it.
### In particular, example Windows specific settings are included here
### by means of    ifdef Win32   conditionals (where Win32 is a Makefile
### variable that can be set on the command line, for example).
### It should be easy to edit these out.
### As far as I know, the only other non-portable feature is the
### use of %-pattern rules, but they occur in many makes.

# Options can be passed by setting variables from the command line:
# pass   Gtk=   to build with Gtk+1.2
# pass   Win32=1  to build with MinGW on Win32 without MSYS
# pass   Win32=2  to build with MinGW and MSYS
# pass   Warnings=1  to switch on almost all compiler warnings

# The things you are most likely to change come first!

# first target: don't change!
all::

### Local configuration options. Read and edit as necessary.

# Which gtk+ version do you want?
# If you're using GTK+ 1.2, set Gtk to be empty
# Gtk =
# if you're using GTK+ 2.n, for ANY n, set Gtk to be 2.0 .
Gtk = 2.0

# This is not available in current public releases.
# Uncomment the following line to build the table manager.
# TableManager=1

# The directory in which to find the tile pixmaps that are
# compiled into the program. Beware of licensing considerations.
# (The tiles-v1 pixmaps may only be linked into GPLed programs.)
FALLBACKTILES=./tiles-v1

# The directory in which to find tile pixmaps.
# Defaults to NULL, causing the compiled-in tiles to be used.
TILESET=NULL

# The search path for finding tile pixmap directories.
# Defaults to NULL, meaning current directory.
TILESETPATH=NULL

# Where to install the programs.
# (Don't bother with this on Windows; I don't have an install target
# for Windows.)
# The binaries go into  $(DESTDIR)$(BINDIR)
DESTDIR = /usr/local/
BINDIR = bin
# The man pages go into $(DESTDIR)$(MANDIR)
MANDIR = man/man1
# and the appropriate suffix is 1
MANSUFFIX = 1

### End of local configuration.

### System dependent settings.
# This section contains compiler settings etc.
# If you think this reminds of you something, you're right: this
# makefile was made by stripping out most of an imake-generated file.

# It's best to use gcc if you can.
CC = gcc

# C debugging and optimization flags. 
# In development, we turn on all reasonable warnings.
# However, in the production releases, we don't because other people's
# code (e.g. glib) may provoke warnings.
# Also, we do NOT enable optimization by default, because RedHat 6
# Linux distributions have a seriously buggy C compiler.
# I thought the preceding comment should be deleted...but in 2009,
# SuSE ships with a seriously buggy C compiler (gcc 4.3). So I'll
# just leave optimization switched off.
ifdef Warnings
CDEBUGFLAGS = -g -Wall -W -Wstrict-prototypes -Wmissing-prototypes
else
CDEBUGFLAGS = -g
endif
# The -Wconversion flag is also useful to detect (more than usual)
# abuse of enums, but it generates many superfluous warnings, so
# is not on by default.
# To check for non-ANSI usages, use -ansi; 
# to get all the ANSI-mandated warnings, use -pedantic, but 
# this is so pedantic it's not worth it.

# Defines for the compilation.
ifdef Win32
WINDEFINES = -DWIN32=1
endif

ifeq ($(Win32),2)
# This doesn't work if one tries to set these. Does anybody know
# how to get a double quote through DOS or whatever to gcc ?
DEFINES = -DTILESET=$(TILESET) -DTILESETPATH=$(TILESETPATH) $(WINDEFINES)
else
DEFINES = -DTILESET='$(TILESET)' -DTILESETPATH='$(TILESETPATH)' $(WINDEFINES)
endif

ifdef Gtk
GTKDEFINES = -DGTK2=1
endif

# Options for compiling.
ifdef Win32
# this is suitable for recent mingw releases (the equivalent
# of the old -fnative-struct)
CCOPTIONS = -mms-bitfields
endif

# Extra libraries needed above whatever the system provides you with.
# Things like -lnsl on Solaris are the most likely examples.
ifdef Win32
# We need the winsock libraries
LDLIBS =  -lwsock32
else
# Red Hat and Mandrake (and probably most other) Linux systems
# need nothing, as any needed libraries are brought in for gtk anyway.
LDLIBS =/lib/libm.so.6
# If you are on Solaris, you may need the following:
# LDLIBS = -lsocket -lnsl
# If you are on HP-UX, you may need
# LDLIBS = -lm
endif

# some systems have buggy malloc/realloc etc, so we may use
# Doug Lea's implementation. This is switched on for Windows
# at the moment
ifdef Win32
MALLOCSRC = malloc.c
MALLOCOBJ = malloc.o
endif

# The xmj program is built with gtk+, so it needs to know where the
# libraries and headers are.
ifdef Win32
ifdef Gtk
# should be the same as unix, if it can find pkg-config
EXTRA_INCLUDES=$(shell pkg-config --cflags gtk+-$(Gtk))
# We also add the flag that makes xmj.exe be a GUI program
GUILIBS=$(shell pkg-config --libs gtk+-$(Gtk)) -mwindows
else
# You'll need to say explicitly where they are, as here, which is
# a bit of a mess in my setup
EXTRA_INCLUDES=-IC:/gtk/include/glib-2.0 -IC:/gtk/lib/glib-2.0/include -IC:/gtk/include -IC:/gtk/lib/gtk+/include
# We also add the flag that makes xmj.exe be a GUI program
GUILIBS=-LC:/gtk/lib -lgtk-0 -lgdk-0 -LC:/gtk/bin/ -lglib-2.0-0 -lgmodule-2.0-0 -mwindows
endif
else
# Not Windows. If gtk+ is properly installed, this is all that's needed.
ifdef Gtk
EXTRA_INCLUDES=`pkg-config --cflags gtk+-$(Gtk)`
GUILIBS=`pkg-config --libs gtk+-$(Gtk)`
else
EXTRA_INCLUDES=`gtk-config --cflags`
GUILIBS=`gtk-config --libs`
endif
endif

# We use gcc to link as well
CCLINK = $(CC)

# don't mess with these
ALLINCLUDES = $(INCLUDES) $(EXTRA_INCLUDES)
ALLDEFINES = $(ALLINCLUDES) $(EXTRA_DEFINES) $(DEFINES) $(GTKDEFINES)
CFLAGS = $(EXTRA_CFLAGS) $(CDEBUGFLAGS) $(CCOPTIONS) $(ALLDEFINES)
LDOPTIONS = $(CDEBUGFLAGS) $(CCOPTIONS)  $(EXTRA_LDOPTIONS) 

# various auxiliary program and settings.
ifeq ($(Win32),)
# GNU make, we hope
MAKE = make
CP = cp -f
RM = rm -f
# makedep is a gcc-based makedepend that doesn't look at the 
# standard files.
DEPEND = ./makedep
DEPENDFLAGS =
# perl is needed for generating several files
PERL = perl
# suffix of executables
EXE = 
# programs used in installation
MKDIRHIER = mkdir -p
INSTALL = install
INSTALLFLAGS = -c
INSTPGMFLAGS = -s
INSTMANFLAGS = -m 0444
else
ifeq ($(Win32),1)
# Windows with mingw but not msyste
# GNU make, we hope
MAKE = make
CP = xcopy
# suppress errors, since del complains if file not there to remove
RM = -del /f
# we don't have a makedepend on windows ...
DEPEND =
DEPENDFLAGS =
# perl is needed for generating several files
PERL = perl
# suffix of executables
EXE = .exe
# programs used in installation: not in windows
MKDIRHIER = 
INSTALL = 
INSTALLFLAGS = 
INSTPGMFLAGS = 
INSTMANFLAGS = 
else
# windows with msys
MAKE = make
CP = cp -f
RM = rm -f
# we don't have a makedepend on windows ...
DEPEND =
DEPENDFLAGS =
# perl is needed for generating several files
PERL = perl
# suffix of executables
EXE = .exe
# programs used in installation: not in windows
MKDIRHIER = 
INSTALL = 
INSTALLFLAGS = 
INSTPGMFLAGS = 
INSTMANFLAGS = 
endif
endif
### There should be no need to edit after this point,
### unless you're using a non-GNU make.


all:: Makefile

Makefile: Makefile.in
	$(RM) $@
	$(CP) $< $@
	make depend

# Autogenerated files to do with the table manager
ifdef TableManager
 TMAUTOGENS = enc_mcmsg.c enc_mpmsg.c dec_mcmsg.c dec_mpmsg.c mcmsg_union.h mcmsg_size.c mpmsg_union.h mpmsg_size.c mprotocol-enums.c mprotocol-enums.h
else
 TMAUTOGENS = 
endif

# This variable lists all the auto-generated program files.
AUTOGENS = enc_cmsg.c enc_pmsg.c dec_cmsg.c dec_pmsg.c cmsg_union.h cmsg_size.c pmsg_union.h pmsg_size.c  game-enums.c game-enums.h player-enums.c player-enums.h protocol-enums.c protocol-enums.h  tiles-enums.c tiles-enums.h fbtiles.c version.h $(TMAUTOGENS)

# This is a trick to make the auto-generated files be created
# by make depend, if they're not already there. Otherwise the
# make depend won't put them in the dependencies.
depend:: $(AUTOGENS)
	echo Remade some auto-generated files

# The programs
ifdef TableManager
 PROGRAMS = xmj$(EXE) mj-server$(EXE) mj-player$(EXE) mj-manager$(EXE)
else
 PROGRAMS = xmj$(EXE) mj-server$(EXE) mj-player$(EXE)
endif

all:: $(PROGRAMS)

# The controller target. Requires player, tiles, protocol, sysdep

SRCS1 = controller.c player.c tiles.c protocol.c game.c scoring.c sysdep.c $(MALLOCSRC)
OBJS1 = controller.o player.o tiles.o protocol.o game.o scoring.o sysdep.o $(MALLOCOBJ)

 OBJS = $(OBJS1) $(OBJS2) $(OBJS3) $(OBJS4)
 SRCS = $(SRCS1) $(SRCS2) $(SRCS3) $(SRCS4)

mj-server$(EXE): $(OBJS1)
	$(RM) $@
	$(CCLINK) -o $@ $(LDOPTIONS) $(OBJS1)  $(LDLIBS)  $(EXTRA_LOAD_FLAGS)

ifndef Win32

install:: mj-server$(EXE)
	@if [ -d $(DESTDIR)$(BINDIR) ]; then set +x; \
	else (set -x; $(MKDIRHIER) $(DESTDIR)$(BINDIR)); fi
	$(INSTALL) $(INSTALLFLAGS) $(INSTPGMFLAGS)  mj-server$(EXE) $(DESTDIR)$(BINDIR)/mj-server

install.man:: mj-server.man
	@if [ -d $(DESTDIR)$(MANDIR) ]; then set +x; \
	else (set -x; $(MKDIRHIER) $(DESTDIR)$(MANDIR)); fi
	$(INSTALL) $(INSTALLFLAGS) $(INSTMANFLAGS) mj-server.man $(DESTDIR)$(MANDIR)/mj-server.$(MANSUFFIX)

endif # Win32

ifdef TableManager
# The table manager. Requires mprotocol and sysdep
SRCS4 = manager.c mprotocol.c sysdep.c $(MALLOCSRC)
OBJS4 = manager.o mprotocol.o sysdep.o $(MALLOCOBJ)

mj-manager$(EXE): $(OBJS4)
	$(RM) $@
	$(CCLINK) -o $@ $(LDOPTIONS) $(OBJS4)  $(LDLIBS)  $(EXTRA_LOAD_FLAGS)

ifndef Win32

install:: mj-manager$(EXE)
	@if [ -d $(DESTDIR)$(BINDIR) ]; then set +x; \
	else (set -x; $(MKDIRHIER) $(DESTDIR)$(BINDIR)); fi
	$(INSTALL) $(INSTALLFLAGS) $(INSTPGMFLAGS)  mj-manager$(EXE) $(DESTDIR)$(BINDIR)/mj-manager

install.man:: mj-manager.man
	@if [ -d $(DESTDIR)$(MANDIR) ]; then set +x; \
	else (set -x; $(MKDIRHIER) $(DESTDIR)$(MANDIR)); fi
	$(INSTALL) $(INSTALLFLAGS) $(INSTMANFLAGS) mj-manager.man $(DESTDIR)$(MANDIR)/mj-manager.$(MANSUFFIX)

endif # Win32

endif # TableManager

# the greedy player

SRCS2 = greedy.c client.c player.c tiles.c protocol.c game.c sysdep.c $(MALLOCSRC)
SRCS2A = client.c player.c tiles.c protocol.c game.c sysdep.c $(MALLOCSRC)
OBJS2 = greedy.o client.o player.o tiles.o protocol.o game.o sysdep.o $(MALLOCOBJ)
OBJS2A = client.o player.o tiles.o protocol.o game.o sysdep.o $(MALLOCOBJ)

mj-player$(EXE): $(OBJS2) $(DEPLIBS2)
	$(RM) $@
	$(CCLINK) -o $@ $(LDOPTIONS) $(OBJS2)  $(LDLIBS)  $(EXTRA_LOAD_FLAGS)

ga: ga.o $(OBJS2A) $(DEPLIBS2)
	$(RM) $@
	$(CCLINK) -o $@ $(LDOPTIONS) ga.o $(OBJS2A)  $(LDLIBS)  $(EXTRA_LOAD_FLAGS)

# generic greedy variants
greedy-%.o: greedy-%.c $(SRCS2A)

greedy-%: greedy-%.o $(OBJS2A)
	$(RM) $@
	$(CCLINK) -o $@ $(LDOPTIONS) $< $(OBJS2A)  $(LDLIBS)  $(EXTRA_LOAD_FLAGS)

ifndef Win32

install:: mj-player$(EXE)
	@if [ -d $(DESTDIR)$(BINDIR) ]; then set +x; \
	else (set -x; $(MKDIRHIER) $(DESTDIR)$(BINDIR)); fi
	$(INSTALL) $(INSTALLFLAGS) $(INSTPGMFLAGS)  mj-player$(EXE) $(DESTDIR)$(BINDIR)/mj-player

install.man:: mj-player.man
	@if [ -d $(DESTDIR)$(MANDIR) ]; then set +x; \
	else (set -x; $(MKDIRHIER) $(DESTDIR)$(MANDIR)); fi
	$(INSTALL) $(INSTALLFLAGS) $(INSTMANFLAGS) mj-player.man $(DESTDIR)$(MANDIR)/mj-player.$(MANSUFFIX)

endif # Win32

# the gui

ifdef Win32
# the icon resource file and object
ICONOBJ = iconres.o
iconres.o: iconres.rs icon.ico
	windres iconres.rs iconres.o
else
ICONOBJ =
endif

SRCS3 = gui.c gui-dial.c lazyfixed.c vlazyfixed.c client.c player.c tiles.c fbtiles.c protocol.c game.c sysdep.c $(MALLOCSRC)
OBJS3 = gui.o gui-dial.o client.o lazyfixed.o vlazyfixed.o player.o tiles.o fbtiles.o protocol.o game.o sysdep.o $(MALLOCOBJ) $(ICONOBJ)

xmj$(EXE): $(OBJS3) $(DEPLIBS3)
	$(RM) $@
	$(CCLINK) -o $@ $(LDOPTIONS) $(OBJS3) $(GUILIBS) $(LDLIBS)  $(EXTRA_LOAD_FLAGS)

install:: xmj$(EXE)
	@if [ -d $(DESTDIR)$(BINDIR) ]; then set +x; \
	else (set -x; $(MKDIRHIER) $(DESTDIR)$(BINDIR)); fi
	$(INSTALL) $(INSTALLFLAGS) $(INSTPGMFLAGS)  xmj$(EXE) $(DESTDIR)$(BINDIR)/xmj

install.man:: xmj.man
	@if [ -d $(DESTDIR)$(MANDIR) ]; then set +x; \
	else (set -x; $(MKDIRHIER) $(DESTDIR)$(MANDIR)); fi
	$(INSTALL) $(INSTALLFLAGS) $(INSTMANFLAGS) xmj.man $(DESTDIR)$(MANDIR)/xmj.$(MANSUFFIX)

# version.h is now made from version.h.in by the release script.
# so if we are not making a release, we'd better provide it if
# it isn't there.
version.h:
	cp version.h.in $@
	chmod u+w $@

# rule to generate the fallback tiles
fbtiles.c: $(FALLBACKTILES) makefallbacktiles Makefile
	$(PERL) makefallbacktiles $(FALLBACKTILES) >fbtiles.c

# Rules for the auto generated files

enc_cmsg.c: protocol.h proto-encode-msg.pl
	$(PERL) proto-encode-msg.pl -cmsg

enc_pmsg.c: protocol.h proto-encode-msg.pl
	$(PERL) proto-encode-msg.pl -pmsg

dec_cmsg.c: protocol.h proto-decode-msg.pl
	$(PERL) proto-decode-msg.pl -cmsg

dec_pmsg.c: protocol.h proto-decode-msg.pl
	$(PERL) proto-decode-msg.pl -pmsg

# rules for the other auxiliary files
# the commands will be executed twice, but never mind.
cmsg_union.h cmsg_size.c: protocol.h proto-encode-msg.pl
	$(PERL) proto-encode-msg.pl -cmsg

pmsg_union.h pmsg_size.c: protocol.h proto-encode-msg.pl
	$(PERL) proto-encode-msg.pl -pmsg

enc_mcmsg.c: protocol.h proto-encode-msg.pl
	$(PERL) proto-encode-msg.pl -mcmsg

enc_mpmsg.c: protocol.h proto-encode-msg.pl
	$(PERL) proto-encode-msg.pl -mpmsg

dec_mcmsg.c: protocol.h proto-decode-msg.pl
	$(PERL) proto-decode-msg.pl -mcmsg

dec_mpmsg.c: protocol.h proto-decode-msg.pl
	$(PERL) proto-decode-msg.pl -mpmsg

# rules for the other auxiliary files
# the commands will be executed twice, but never mind.
mcmsg_union.h mcmsg_size.c: protocol.h proto-encode-msg.pl
	$(PERL) proto-encode-msg.pl -mcmsg

mpmsg_union.h mpmsg_size.c: protocol.h proto-encode-msg.pl
	$(PERL) proto-encode-msg.pl -mpmsg

# Rule for the enum parsing files:
%-enums.h: %.h make-enums.pl
	$(PERL) make-enums.pl $<

%-enums.c: %.h make-enums.pl
	$(PERL) make-enums.pl $<

# distclean also removes the auto-generated files and the Makefile
distclean:: clean
	$(RM) Makefile $(AUTOGENS)

# used to build a source release
textdocs:: use.txt rules.txt

use.txt rules.txt: xmj.man
	$(RM) use.txt rules.txt
	$(PERL) maketxt xmj.man
	chmod 444 use.txt rules.txt



depend::
	$(DEPEND) $(DEPENDFLAGS) -- $(ALLDEFINES) $(DEPEND_DEFINES) -- $(SRCS)

clean::
	$(RM) $(PROGRAMS)

clean::
	$(RM) *.o core errs *~
# DO NOT DELETE
controller.o: controller.c controller.h tiles.h tiles-enums.h player.h \
 player-enums.h protocol.h cmsg_union.h pmsg_union.h protocol-enums.h \
 game.h game-enums.h scoring.h sysdep.h version.h
player.o: player.c player.h tiles.h tiles-enums.h player-enums.h sysdep.h \
 player-enums.c
tiles.o: tiles.c tiles.h tiles-enums.h protocol.h player.h player-enums.h \
 cmsg_union.h pmsg_union.h protocol-enums.h sysdep.h tiles-enums.c
protocol.o: protocol.c protocol.h tiles.h tiles-enums.h player.h \
 player-enums.h cmsg_union.h pmsg_union.h protocol-enums.h sysdep.h \
 enc_cmsg.c dec_cmsg.c enc_pmsg.c dec_pmsg.c cmsg_size.c pmsg_size.c \
 protocol-enums.c
game.o: game.c game.h tiles.h tiles-enums.h player.h player-enums.h \
 protocol.h cmsg_union.h pmsg_union.h protocol-enums.h game-enums.h \
 sysdep.h game-enums.c
scoring.o: scoring.c tiles.h tiles-enums.h player.h player-enums.h \
 controller.h protocol.h cmsg_union.h pmsg_union.h protocol-enums.h \
 game.h game-enums.h scoring.h sysdep.h
sysdep.o: sysdep.c sysdep.h
greedy.o: greedy.c client.h game.h tiles.h tiles-enums.h player.h \
 player-enums.h protocol.h cmsg_union.h pmsg_union.h protocol-enums.h \
 game-enums.h sysdep.h version.h
client.o: client.c sysdep.h client.h game.h tiles.h tiles-enums.h \
 player.h player-enums.h protocol.h cmsg_union.h pmsg_union.h \
 protocol-enums.h game-enums.h
player.o: player.c player.h tiles.h tiles-enums.h player-enums.h sysdep.h \
 player-enums.c
tiles.o: tiles.c tiles.h tiles-enums.h protocol.h player.h player-enums.h \
 cmsg_union.h pmsg_union.h protocol-enums.h sysdep.h tiles-enums.c
protocol.o: protocol.c protocol.h tiles.h tiles-enums.h player.h \
 player-enums.h cmsg_union.h pmsg_union.h protocol-enums.h sysdep.h \
 enc_cmsg.c dec_cmsg.c enc_pmsg.c dec_pmsg.c cmsg_size.c pmsg_size.c \
 protocol-enums.c
game.o: game.c game.h tiles.h tiles-enums.h player.h player-enums.h \
 protocol.h cmsg_union.h pmsg_union.h protocol-enums.h game-enums.h \
 sysdep.h game-enums.c
sysdep.o: sysdep.c sysdep.h
gui.o: gui.c gui.h /usr/include/gtk-2.0/gtk/gtk.h \
 /usr/include/gtk-2.0/gdk/gdk.h \
 /usr/include/gtk-2.0/gdk/gdkapplaunchcontext.h \
 /usr/include/glib-2.0/gio/gio.h /usr/include/glib-2.0/gio/giotypes.h \
 /usr/include/glib-2.0/gio/gioenums.h /usr/include/glib-2.0/glib-object.h \
 /usr/include/glib-2.0/gobject/gbinding.h /usr/include/glib-2.0/glib.h \
 /usr/include/glib-2.0/glib/galloca.h /usr/include/glib-2.0/glib/gtypes.h \
 /usr/lib/glib-2.0/include/glibconfig.h \
 /usr/include/glib-2.0/glib/gmacros.h /usr/include/glib-2.0/glib/garray.h \
 /usr/include/glib-2.0/glib/gasyncqueue.h \
 /usr/include/glib-2.0/glib/gthread.h /usr/include/glib-2.0/glib/gerror.h \
 /usr/include/glib-2.0/glib/gquark.h /usr/include/glib-2.0/glib/gutils.h \
 /usr/include/glib-2.0/glib/gatomic.h \
 /usr/include/glib-2.0/glib/gbacktrace.h \
 /usr/include/glib-2.0/glib/gbase64.h \
 /usr/include/glib-2.0/glib/gbitlock.h \
 /usr/include/glib-2.0/glib/gbookmarkfile.h \
 /usr/include/glib-2.0/glib/glist.h \
 /usr/include/glib-2.0/glib/gmem.h /usr/include/glib-2.0/glib/gslice.h \
 /usr/include/glib-2.0/glib/gchecksum.h \
 /usr/include/glib-2.0/glib/gconvert.h \
 /usr/include/glib-2.0/glib/gdataset.h /usr/include/glib-2.0/glib/gdate.h \
 /usr/include/glib-2.0/glib/gdatetime.h \
 /usr/include/glib-2.0/glib/gtimezone.h /usr/include/glib-2.0/glib/gdir.h \
 /usr/include/glib-2.0/glib/gfileutils.h \
 /usr/include/glib-2.0/glib/ghash.h /usr/include/glib-2.0/glib/ghook.h \
 /usr/include/glib-2.0/glib/ghostutils.h \
 /usr/include/glib-2.0/glib/giochannel.h \
 /usr/include/glib-2.0/glib/gmain.h /usr/include/glib-2.0/glib/gpoll.h \
 /usr/include/glib-2.0/glib/gslist.h /usr/include/glib-2.0/glib/gstring.h \
 /usr/include/glib-2.0/glib/gunicode.h \
 /usr/include/glib-2.0/glib/gkeyfile.h \
 /usr/include/glib-2.0/glib/gmappedfile.h \
 /usr/include/glib-2.0/glib/gmarkup.h \
 /usr/include/glib-2.0/glib/gmessages.h \
 /usr/include/glib-2.0/glib/gnode.h /usr/include/glib-2.0/glib/goption.h \
 /usr/include/glib-2.0/glib/gpattern.h \
 /usr/include/glib-2.0/glib/gprimes.h /usr/include/glib-2.0/glib/gqsort.h \
 /usr/include/glib-2.0/glib/gqueue.h /usr/include/glib-2.0/glib/grand.h \
 /usr/include/glib-2.0/glib/gregex.h \
 /usr/include/glib-2.0/glib/gscanner.h \
 /usr/include/glib-2.0/glib/gsequence.h \
 /usr/include/glib-2.0/glib/gshell.h /usr/include/glib-2.0/glib/gspawn.h \
 /usr/include/glib-2.0/glib/gstrfuncs.h \
 /usr/include/glib-2.0/glib/gtestutils.h \
 /usr/include/glib-2.0/glib/gthreadpool.h \
 /usr/include/glib-2.0/glib/gtimer.h /usr/include/glib-2.0/glib/gtree.h \
 /usr/include/glib-2.0/glib/gurifuncs.h \
 /usr/include/glib-2.0/glib/gvarianttype.h \
 /usr/include/glib-2.0/glib/gvariant.h \
 /usr/include/glib-2.0/gobject/gobject.h \
 /usr/include/glib-2.0/gobject/gtype.h \
 /usr/include/glib-2.0/gobject/gvalue.h \
 /usr/include/glib-2.0/gobject/gparam.h \
 /usr/include/glib-2.0/gobject/gclosure.h \
 /usr/include/glib-2.0/gobject/gsignal.h \
 /usr/include/glib-2.0/gobject/gmarshal.h \
 /usr/include/glib-2.0/gobject/gboxed.h \
 /usr/include/glib-2.0/gobject/genums.h \
 /usr/include/glib-2.0/gobject/gparamspecs.h \
 /usr/include/glib-2.0/gobject/gsourceclosure.h \
 /usr/include/glib-2.0/gobject/gtypemodule.h \
 /usr/include/glib-2.0/gobject/gtypeplugin.h \
 /usr/include/glib-2.0/gobject/gvaluearray.h \
 /usr/include/glib-2.0/gobject/gvaluetypes.h \
 /usr/include/glib-2.0/gio/gappinfo.h /usr/include/glib-2.0/gio/gaction.h \
 /usr/include/glib-2.0/gio/gsimpleaction.h \
 /usr/include/glib-2.0/gio/gactiongroup.h \
 /usr/include/glib-2.0/gio/gsimpleactiongroup.h \
 /usr/include/glib-2.0/gio/gactiongroup.h \
 /usr/include/glib-2.0/gio/gapplication.h \
 /usr/include/glib-2.0/gio/gapplicationcommandline.h \
 /usr/include/glib-2.0/gio/gasyncinitable.h \
 /usr/include/glib-2.0/gio/ginitable.h \
 /usr/include/glib-2.0/gio/gasyncresult.h \
 /usr/include/glib-2.0/gio/gbufferedinputstream.h \
 /usr/include/glib-2.0/gio/gfilterinputstream.h \
 /usr/include/glib-2.0/gio/ginputstream.h \
 /usr/include/glib-2.0/gio/gbufferedoutputstream.h \
 /usr/include/glib-2.0/gio/gfilteroutputstream.h \
 /usr/include/glib-2.0/gio/goutputstream.h \
 /usr/include/glib-2.0/gio/gcancellable.h \
 /usr/include/glib-2.0/gio/gcharsetconverter.h \
 /usr/include/glib-2.0/gio/gconverter.h \
 /usr/include/glib-2.0/gio/gcontenttype.h \
 /usr/include/glib-2.0/gio/gconverterinputstream.h \
 /usr/include/glib-2.0/gio/gconverteroutputstream.h \
 /usr/include/glib-2.0/gio/gcredentials.h \
 /usr/include/glib-2.0/gio/gdatainputstream.h \
 /usr/include/glib-2.0/gio/gdataoutputstream.h \
 /usr/include/glib-2.0/gio/gdbusaddress.h \
 /usr/include/glib-2.0/gio/gdbusauthobserver.h \
 /usr/include/glib-2.0/gio/gdbusconnection.h \
 /usr/include/glib-2.0/gio/gdbuserror.h \
 /usr/include/glib-2.0/gio/gdbusintrospection.h \
 /usr/include/glib-2.0/gio/gdbusmessage.h \
 /usr/include/glib-2.0/gio/gdbusmethodinvocation.h \
 /usr/include/glib-2.0/gio/gdbusnameowning.h \
 /usr/include/glib-2.0/gio/gdbusnamewatching.h \
 /usr/include/glib-2.0/gio/gdbusproxy.h \
 /usr/include/glib-2.0/gio/gdbusserver.h \
 /usr/include/glib-2.0/gio/gdbusutils.h \
 /usr/include/glib-2.0/gio/gdrive.h \
 /usr/include/glib-2.0/gio/gemblemedicon.h \
 /usr/include/glib-2.0/gio/gicon.h /usr/include/glib-2.0/gio/gemblem.h \
 /usr/include/glib-2.0/gio/gfileattribute.h \
 /usr/include/glib-2.0/gio/gfileenumerator.h \
 /usr/include/glib-2.0/gio/gfile.h /usr/include/glib-2.0/gio/gfileicon.h \
 /usr/include/glib-2.0/gio/gfileinfo.h \
 /usr/include/glib-2.0/gio/gfileinputstream.h \
 /usr/include/glib-2.0/gio/gfileiostream.h \
 /usr/include/glib-2.0/gio/giostream.h \
 /usr/include/glib-2.0/gio/gioerror.h \
 /usr/include/glib-2.0/gio/gfilemonitor.h \
 /usr/include/glib-2.0/gio/gfilenamecompleter.h \
 /usr/include/glib-2.0/gio/gfileoutputstream.h \
 /usr/include/glib-2.0/gio/ginetaddress.h \
 /usr/include/glib-2.0/gio/ginetsocketaddress.h \
 /usr/include/glib-2.0/gio/gsocketaddress.h \
 /usr/include/glib-2.0/gio/gioenumtypes.h \
 /usr/include/glib-2.0/gio/giomodule.h /usr/include/glib-2.0/gmodule.h \
 /usr/include/glib-2.0/gio/gioscheduler.h \
 /usr/include/glib-2.0/gio/gloadableicon.h \
 /usr/include/glib-2.0/gio/gmemoryinputstream.h \
 /usr/include/glib-2.0/gio/gmemoryoutputstream.h \
 /usr/include/glib-2.0/gio/gmount.h \
 /usr/include/glib-2.0/gio/gmountoperation.h \
 /usr/include/glib-2.0/gio/gnativevolumemonitor.h \
 /usr/include/glib-2.0/gio/gvolumemonitor.h \
 /usr/include/glib-2.0/gio/gnetworkaddress.h \
 /usr/include/glib-2.0/gio/gnetworkservice.h \
 /usr/include/glib-2.0/gio/gpermission.h \
 /usr/include/glib-2.0/gio/gpollableinputstream.h \
 /usr/include/glib-2.0/gio/gpollableoutputstream.h \
 /usr/include/glib-2.0/gio/gproxy.h \
 /usr/include/glib-2.0/gio/gproxyaddress.h \
 /usr/include/glib-2.0/gio/gproxyaddressenumerator.h \
 /usr/include/glib-2.0/gio/gsocketaddressenumerator.h \
 /usr/include/glib-2.0/gio/gproxyresolver.h \
 /usr/include/glib-2.0/gio/gresolver.h \
 /usr/include/glib-2.0/gio/gseekable.h \
 /usr/include/glib-2.0/gio/gsettings.h \
 /usr/include/glib-2.0/gio/gsimpleasyncresult.h \
 /usr/include/glib-2.0/gio/gsimplepermission.h \
 /usr/include/glib-2.0/gio/gsocketclient.h \
 /usr/include/glib-2.0/gio/gsocketconnectable.h \
 /usr/include/glib-2.0/gio/gsocketconnection.h \
 /usr/include/glib-2.0/gio/gsocket.h \
 /usr/include/glib-2.0/gio/gsocketcontrolmessage.h \
 /usr/include/glib-2.0/gio/gsocketlistener.h \
 /usr/include/glib-2.0/gio/gsocketservice.h \
 /usr/include/glib-2.0/gio/gsrvtarget.h \
 /usr/include/glib-2.0/gio/gtcpconnection.h \
 /usr/include/glib-2.0/gio/gtcpwrapperconnection.h \
 /usr/include/glib-2.0/gio/gthemedicon.h \
 /usr/include/glib-2.0/gio/gthreadedsocketservice.h \
 /usr/include/glib-2.0/gio/gtlsbackend.h \
 /usr/include/glib-2.0/gio/gtlscertificate.h \
 /usr/include/glib-2.0/gio/gtlsclientconnection.h \
 /usr/include/glib-2.0/gio/gtlsconnection.h \
 /usr/include/glib-2.0/gio/gtlsserverconnection.h \
 /usr/include/glib-2.0/gio/gvfs.h /usr/include/glib-2.0/gio/gvolume.h \
 /usr/include/glib-2.0/gio/gzlibcompressor.h \
 /usr/include/glib-2.0/gio/gzlibdecompressor.h \
 /usr/include/gtk-2.0/gdk/gdkscreen.h /usr/include/cairo/cairo.h \
 /usr/include/cairo/cairo-version.h /usr/include/cairo/cairo-features.h \
 /usr/include/cairo/cairo-deprecated.h \
 /usr/include/gtk-2.0/gdk/gdktypes.h /usr/include/pango-1.0/pango/pango.h \
 /usr/include/pango-1.0/pango/pango-attributes.h \
 /usr/include/pango-1.0/pango/pango-font.h \
 /usr/include/pango-1.0/pango/pango-coverage.h \
 /usr/include/pango-1.0/pango/pango-types.h \
 /usr/include/pango-1.0/pango/pango-gravity.h \
 /usr/include/pango-1.0/pango/pango-matrix.h \
 /usr/include/pango-1.0/pango/pango-script.h \
 /usr/include/pango-1.0/pango/pango-language.h \
 /usr/include/pango-1.0/pango/pango-bidi-type.h \
 /usr/include/pango-1.0/pango/pango-break.h \
 /usr/include/pango-1.0/pango/pango-item.h \
 /usr/include/pango-1.0/pango/pango-context.h \
 /usr/include/pango-1.0/pango/pango-fontmap.h \
 /usr/include/pango-1.0/pango/pango-fontset.h \
 /usr/include/pango-1.0/pango/pango-engine.h \
 /usr/include/pango-1.0/pango/pango-glyph.h \
 /usr/include/pango-1.0/pango/pango-enum-types.h \
 /usr/include/pango-1.0/pango/pango-features.h \
 /usr/include/pango-1.0/pango/pango-glyph-item.h \
 /usr/include/pango-1.0/pango/pango-layout.h \
 /usr/include/pango-1.0/pango/pango-tabs.h \
 /usr/include/pango-1.0/pango/pango-renderer.h \
 /usr/include/pango-1.0/pango/pango-utils.h \
 /usr/lib/gtk-2.0/include/gdkconfig.h \
 /usr/include/gtk-2.0/gdk/gdkdisplay.h \
 /usr/include/gtk-2.0/gdk/gdkevents.h /usr/include/gtk-2.0/gdk/gdkcolor.h \
 /usr/include/gtk-2.0/gdk/gdkdnd.h /usr/include/gtk-2.0/gdk/gdkinput.h \
 /usr/include/gtk-2.0/gdk/gdkcairo.h /usr/include/gtk-2.0/gdk/gdkpixbuf.h \
 /usr/include/gtk-2.0/gdk/gdkrgb.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-features.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-core.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-transform.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-animation.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-simple-anim.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-io.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-loader.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-enum-types.h \
 /usr/include/pango-1.0/pango/pangocairo.h \
 /usr/include/gtk-2.0/gdk/gdkcursor.h \
 /usr/include/gtk-2.0/gdk/gdkdisplaymanager.h \
 /usr/include/gtk-2.0/gdk/gdkdrawable.h /usr/include/gtk-2.0/gdk/gdkgc.h \
 /usr/include/gtk-2.0/gdk/gdkenumtypes.h \
 /usr/include/gtk-2.0/gdk/gdkfont.h /usr/include/gtk-2.0/gdk/gdkimage.h \
 /usr/include/gtk-2.0/gdk/gdkkeys.h /usr/include/gtk-2.0/gdk/gdkpango.h \
 /usr/include/gtk-2.0/gdk/gdkpixmap.h \
 /usr/include/gtk-2.0/gdk/gdkproperty.h \
 /usr/include/gtk-2.0/gdk/gdkregion.h \
 /usr/include/gtk-2.0/gdk/gdkselection.h \
 /usr/include/gtk-2.0/gdk/gdkspawn.h \
 /usr/include/gtk-2.0/gdk/gdktestutils.h \
 /usr/include/gtk-2.0/gdk/gdkwindow.h \
 /usr/include/gtk-2.0/gdk/gdkvisual.h \
 /usr/include/gtk-2.0/gtk/gtkaboutdialog.h \
 /usr/include/gtk-2.0/gtk/gtkdialog.h \
 /usr/include/gtk-2.0/gtk/gtkwindow.h \
 /usr/include/gtk-2.0/gtk/gtkaccelgroup.h \
 /usr/include/gtk-2.0/gtk/gtkenums.h /usr/include/gtk-2.0/gtk/gtkbin.h \
 /usr/include/gtk-2.0/gtk/gtkcontainer.h \
 /usr/include/gtk-2.0/gtk/gtkwidget.h \
 /usr/include/gtk-2.0/gtk/gtkobject.h \
 /usr/include/gtk-2.0/gtk/gtktypeutils.h \
 /usr/include/gtk-2.0/gtk/gtktypebuiltins.h \
 /usr/include/gtk-2.0/gtk/gtkdebug.h \
 /usr/include/gtk-2.0/gtk/gtkadjustment.h \
 /usr/include/gtk-2.0/gtk/gtkstyle.h \
 /usr/include/gtk-2.0/gtk/gtksettings.h /usr/include/gtk-2.0/gtk/gtkrc.h \
 /usr/include/atk-1.0/atk/atk.h /usr/include/atk-1.0/atk/atkobject.h \
 /usr/include/atk-1.0/atk/atkstate.h \
 /usr/include/atk-1.0/atk/atkrelationtype.h \
 /usr/include/atk-1.0/atk/atkaction.h \
 /usr/include/atk-1.0/atk/atkcomponent.h \
 /usr/include/atk-1.0/atk/atkutil.h \
 /usr/include/atk-1.0/atk/atkdocument.h \
 /usr/include/atk-1.0/atk/atkeditabletext.h \
 /usr/include/atk-1.0/atk/atktext.h \
 /usr/include/atk-1.0/atk/atkgobjectaccessible.h \
 /usr/include/atk-1.0/atk/atkhyperlink.h \
 /usr/include/atk-1.0/atk/atkhyperlinkimpl.h \
 /usr/include/atk-1.0/atk/atkhypertext.h \
 /usr/include/atk-1.0/atk/atkimage.h \
 /usr/include/atk-1.0/atk/atknoopobject.h \
 /usr/include/atk-1.0/atk/atknoopobjectfactory.h \
 /usr/include/atk-1.0/atk/atkobjectfactory.h \
 /usr/include/atk-1.0/atk/atkplug.h \
 /usr/include/atk-1.0/atk/atkregistry.h \
 /usr/include/atk-1.0/atk/atkobjectfactory.h \
 /usr/include/atk-1.0/atk/atkrelation.h \
 /usr/include/atk-1.0/atk/atkrelationset.h \
 /usr/include/atk-1.0/atk/atkselection.h \
 /usr/include/atk-1.0/atk/atksocket.h \
 /usr/include/atk-1.0/atk/atkstateset.h \
 /usr/include/atk-1.0/atk/atkstreamablecontent.h \
 /usr/include/atk-1.0/atk/atktable.h /usr/include/atk-1.0/atk/atkmisc.h \
 /usr/include/atk-1.0/atk/atkvalue.h \
 /usr/include/gtk-2.0/gtk/gtkaccellabel.h \
 /usr/include/gtk-2.0/gtk/gtklabel.h /usr/include/gtk-2.0/gtk/gtkmisc.h \
 /usr/include/gtk-2.0/gtk/gtkmenu.h \
 /usr/include/gtk-2.0/gtk/gtkmenushell.h \
 /usr/include/gtk-2.0/gtk/gtkaccelmap.h \
 /usr/include/gtk-2.0/gtk/gtkaccessible.h \
 /usr/include/gtk-2.0/gtk/gtkaction.h \
 /usr/include/gtk-2.0/gtk/gtkactiongroup.h \
 /usr/include/gtk-2.0/gtk/gtkactivatable.h \
 /usr/include/gtk-2.0/gtk/gtkalignment.h \
 /usr/include/gtk-2.0/gtk/gtkarrow.h \
 /usr/include/gtk-2.0/gtk/gtkaspectframe.h \
 /usr/include/gtk-2.0/gtk/gtkframe.h \
 /usr/include/gtk-2.0/gtk/gtkassistant.h \
 /usr/include/gtk-2.0/gtk/gtkbbox.h /usr/include/gtk-2.0/gtk/gtkbox.h \
 /usr/include/gtk-2.0/gtk/gtkbindings.h \
 /usr/include/gtk-2.0/gtk/gtkbuildable.h \
 /usr/include/gtk-2.0/gtk/gtkbuilder.h \
 /usr/include/gtk-2.0/gtk/gtkbutton.h /usr/include/gtk-2.0/gtk/gtkimage.h \
 /usr/include/gtk-2.0/gtk/gtkcalendar.h \
 /usr/include/gtk-2.0/gtk/gtksignal.h \
 /usr/include/gtk-2.0/gtk/gtkmarshal.h \
 /usr/include/gtk-2.0/gtk/gtkcelleditable.h \
 /usr/include/gtk-2.0/gtk/gtkcelllayout.h \
 /usr/include/gtk-2.0/gtk/gtkcellrenderer.h \
 /usr/include/gtk-2.0/gtk/gtktreeviewcolumn.h \
 /usr/include/gtk-2.0/gtk/gtktreemodel.h \
 /usr/include/gtk-2.0/gtk/gtktreesortable.h \
 /usr/include/gtk-2.0/gtk/gtkcellrendereraccel.h \
 /usr/include/gtk-2.0/gtk/gtkcellrenderertext.h \
 /usr/include/gtk-2.0/gtk/gtkcellrenderercombo.h \
 /usr/include/gtk-2.0/gtk/gtkcellrendererpixbuf.h \
 /usr/include/gtk-2.0/gtk/gtkcellrendererprogress.h \
 /usr/include/gtk-2.0/gtk/gtkcellrendererspin.h \
 /usr/include/gtk-2.0/gtk/gtkcellrendererspinner.h \
 /usr/include/gtk-2.0/gtk/gtkcellrenderertoggle.h \
 /usr/include/gtk-2.0/gtk/gtkcellview.h \
 /usr/include/gtk-2.0/gtk/gtkcheckbutton.h \
 /usr/include/gtk-2.0/gtk/gtktogglebutton.h \
 /usr/include/gtk-2.0/gtk/gtkcheckmenuitem.h \
 /usr/include/gtk-2.0/gtk/gtkmenuitem.h \
 /usr/include/gtk-2.0/gtk/gtkitem.h \
 /usr/include/gtk-2.0/gtk/gtkclipboard.h \
 /usr/include/gtk-2.0/gtk/gtkselection.h \
 /usr/include/gtk-2.0/gtk/gtktextiter.h \
 /usr/include/gtk-2.0/gtk/gtktexttag.h \
 /usr/include/gtk-2.0/gtk/gtktextchild.h \
 /usr/include/gtk-2.0/gtk/gtkcolorbutton.h \
 /usr/include/gtk-2.0/gtk/gtkcolorsel.h \
 /usr/include/gtk-2.0/gtk/gtkvbox.h \
 /usr/include/gtk-2.0/gtk/gtkcolorseldialog.h \
 /usr/include/gtk-2.0/gtk/gtkcombobox.h \
 /usr/include/gtk-2.0/gtk/gtktreeview.h /usr/include/gtk-2.0/gtk/gtkdnd.h \
 /usr/include/gtk-2.0/gtk/gtkentry.h \
 /usr/include/gtk-2.0/gtk/gtkeditable.h \
 /usr/include/gtk-2.0/gtk/gtkimcontext.h \
 /usr/include/gtk-2.0/gtk/gtkentrybuffer.h \
 /usr/include/gtk-2.0/gtk/gtkentrycompletion.h \
 /usr/include/gtk-2.0/gtk/gtkliststore.h \
 /usr/include/gtk-2.0/gtk/gtktreemodelfilter.h \
 /usr/include/gtk-2.0/gtk/gtkcomboboxentry.h \
 /usr/include/gtk-2.0/gtk/gtkdrawingarea.h \
 /usr/include/gtk-2.0/gtk/gtkeventbox.h \
 /usr/include/gtk-2.0/gtk/gtkexpander.h \
 /usr/include/gtk-2.0/gtk/gtkfixed.h \
 /usr/include/gtk-2.0/gtk/gtkfilechooser.h \
 /usr/include/gtk-2.0/gtk/gtkfilefilter.h \
 /usr/include/gtk-2.0/gtk/gtkfilechooserbutton.h \
 /usr/include/gtk-2.0/gtk/gtkhbox.h \
 /usr/include/gtk-2.0/gtk/gtkfilechooserdialog.h \
 /usr/include/gtk-2.0/gtk/gtkfilechooserwidget.h \
 /usr/include/gtk-2.0/gtk/gtkfontbutton.h \
 /usr/include/gtk-2.0/gtk/gtkfontsel.h /usr/include/gtk-2.0/gtk/gtkgc.h \
 /usr/include/gtk-2.0/gtk/gtkhandlebox.h \
 /usr/include/gtk-2.0/gtk/gtkhbbox.h /usr/include/gtk-2.0/gtk/gtkhpaned.h \
 /usr/include/gtk-2.0/gtk/gtkpaned.h /usr/include/gtk-2.0/gtk/gtkhruler.h \
 /usr/include/gtk-2.0/gtk/gtkruler.h /usr/include/gtk-2.0/gtk/gtkhscale.h \
 /usr/include/gtk-2.0/gtk/gtkscale.h /usr/include/gtk-2.0/gtk/gtkrange.h \
 /usr/include/gtk-2.0/gtk/gtkhscrollbar.h \
 /usr/include/gtk-2.0/gtk/gtkscrollbar.h \
 /usr/include/gtk-2.0/gtk/gtkhseparator.h \
 /usr/include/gtk-2.0/gtk/gtkseparator.h \
 /usr/include/gtk-2.0/gtk/gtkhsv.h \
 /usr/include/gtk-2.0/gtk/gtkiconfactory.h \
 /usr/include/gtk-2.0/gtk/gtkicontheme.h \
 /usr/include/gtk-2.0/gtk/gtkiconview.h \
 /usr/include/gtk-2.0/gtk/gtktooltip.h \
 /usr/include/gtk-2.0/gtk/gtkimagemenuitem.h \
 /usr/include/gtk-2.0/gtk/gtkimcontextsimple.h \
 /usr/include/gtk-2.0/gtk/gtkimmulticontext.h \
 /usr/include/gtk-2.0/gtk/gtkinfobar.h \
 /usr/include/gtk-2.0/gtk/gtkinvisible.h \
 /usr/include/gtk-2.0/gtk/gtklayout.h \
 /usr/include/gtk-2.0/gtk/gtklinkbutton.h \
 /usr/include/gtk-2.0/gtk/gtkmain.h /usr/include/gtk-2.0/gtk/gtkmenubar.h \
 /usr/include/gtk-2.0/gtk/gtkmenutoolbutton.h \
 /usr/include/gtk-2.0/gtk/gtktoolbutton.h \
 /usr/include/gtk-2.0/gtk/gtktoolitem.h \
 /usr/include/gtk-2.0/gtk/gtktooltips.h \
 /usr/include/gtk-2.0/gtk/gtksizegroup.h \
 /usr/include/gtk-2.0/gtk/gtkmessagedialog.h \
 /usr/include/gtk-2.0/gtk/gtkmodules.h \
 /usr/include/gtk-2.0/gtk/gtkmountoperation.h \
 /usr/include/gtk-2.0/gtk/gtknotebook.h \
 /usr/include/gtk-2.0/gtk/gtkoffscreenwindow.h \
 /usr/include/gtk-2.0/gtk/gtkorientable.h \
 /usr/include/gtk-2.0/gtk/gtkpagesetup.h \
 /usr/include/gtk-2.0/gtk/gtkpapersize.h \
 /usr/include/gtk-2.0/gtk/gtkplug.h /usr/include/gtk-2.0/gtk/gtksocket.h \
 /usr/include/gtk-2.0/gtk/gtkprintcontext.h \
 /usr/include/gtk-2.0/gtk/gtkprintoperation.h \
 /usr/include/gtk-2.0/gtk/gtkprintsettings.h \
 /usr/include/gtk-2.0/gtk/gtkprintoperationpreview.h \
 /usr/include/gtk-2.0/gtk/gtkprogressbar.h \
 /usr/include/gtk-2.0/gtk/gtkprogress.h \
 /usr/include/gtk-2.0/gtk/gtkradioaction.h \
 /usr/include/gtk-2.0/gtk/gtktoggleaction.h \
 /usr/include/gtk-2.0/gtk/gtkradiobutton.h \
 /usr/include/gtk-2.0/gtk/gtkradiomenuitem.h \
 /usr/include/gtk-2.0/gtk/gtkradiotoolbutton.h \
 /usr/include/gtk-2.0/gtk/gtktoggletoolbutton.h \
 /usr/include/gtk-2.0/gtk/gtkrecentaction.h \
 /usr/include/gtk-2.0/gtk/gtkrecentmanager.h \
 /usr/include/gtk-2.0/gtk/gtkrecentchooser.h \
 /usr/include/gtk-2.0/gtk/gtkrecentfilter.h \
 /usr/include/gtk-2.0/gtk/gtkrecentchooserdialog.h \
 /usr/include/gtk-2.0/gtk/gtkrecentchoosermenu.h \
 /usr/include/gtk-2.0/gtk/gtkrecentchooserwidget.h \
 /usr/include/gtk-2.0/gtk/gtkscalebutton.h \
 /usr/include/gtk-2.0/gtk/gtkscrolledwindow.h \
 /usr/include/gtk-2.0/gtk/gtkvscrollbar.h \
 /usr/include/gtk-2.0/gtk/gtkviewport.h \
 /usr/include/gtk-2.0/gtk/gtkseparatormenuitem.h \
 /usr/include/gtk-2.0/gtk/gtkseparatortoolitem.h \
 /usr/include/gtk-2.0/gtk/gtkshow.h \
 /usr/include/gtk-2.0/gtk/gtkspinbutton.h \
 /usr/include/gtk-2.0/gtk/gtkspinner.h \
 /usr/include/gtk-2.0/gtk/gtkstatusbar.h \
 /usr/include/gtk-2.0/gtk/gtkstatusicon.h \
 /usr/include/gtk-2.0/gtk/gtkstock.h /usr/include/gtk-2.0/gtk/gtktable.h \
 /usr/include/gtk-2.0/gtk/gtktearoffmenuitem.h \
 /usr/include/gtk-2.0/gtk/gtktextbuffer.h \
 /usr/include/gtk-2.0/gtk/gtktexttagtable.h \
 /usr/include/gtk-2.0/gtk/gtktextmark.h \
 /usr/include/gtk-2.0/gtk/gtktextbufferrichtext.h \
 /usr/include/gtk-2.0/gtk/gtktextview.h \
 /usr/include/gtk-2.0/gtk/gtktoolbar.h \
 /usr/include/gtk-2.0/gtk/gtkpixmap.h \
 /usr/include/gtk-2.0/gtk/gtktoolitemgroup.h \
 /usr/include/gtk-2.0/gtk/gtktoolpalette.h \
 /usr/include/gtk-2.0/gtk/gtktoolshell.h \
 /usr/include/gtk-2.0/gtk/gtktestutils.h \
 /usr/include/gtk-2.0/gtk/gtktreednd.h \
 /usr/include/gtk-2.0/gtk/gtktreemodelsort.h \
 /usr/include/gtk-2.0/gtk/gtktreeselection.h \
 /usr/include/gtk-2.0/gtk/gtktreestore.h \
 /usr/include/gtk-2.0/gtk/gtkuimanager.h \
 /usr/include/gtk-2.0/gtk/gtkvbbox.h \
 /usr/include/gtk-2.0/gtk/gtkversion.h \
 /usr/include/gtk-2.0/gtk/gtkvolumebutton.h \
 /usr/include/gtk-2.0/gtk/gtkvpaned.h \
 /usr/include/gtk-2.0/gtk/gtkvruler.h \
 /usr/include/gtk-2.0/gtk/gtkvscale.h \
 /usr/include/gtk-2.0/gtk/gtkvseparator.h \
 /usr/include/gtk-2.0/gtk/gtktext.h /usr/include/gtk-2.0/gtk/gtktree.h \
 /usr/include/gtk-2.0/gtk/gtktreeitem.h \
 /usr/include/gtk-2.0/gtk/gtkclist.h /usr/include/gtk-2.0/gtk/gtkcombo.h \
 /usr/include/gtk-2.0/gtk/gtkctree.h /usr/include/gtk-2.0/gtk/gtkcurve.h \
 /usr/include/gtk-2.0/gtk/gtkfilesel.h \
 /usr/include/gtk-2.0/gtk/gtkgamma.h \
 /usr/include/gtk-2.0/gtk/gtkinputdialog.h \
 /usr/include/gtk-2.0/gtk/gtkitemfactory.h \
 /usr/include/gtk-2.0/gtk/gtklist.h \
 /usr/include/gtk-2.0/gtk/gtklistitem.h \
 /usr/include/gtk-2.0/gtk/gtkoldeditable.h \
 /usr/include/gtk-2.0/gtk/gtkoptionmenu.h \
 /usr/include/gtk-2.0/gtk/gtkpreview.h \
 /usr/include/gtk-2.0/gtk/gtktipsquery.h \
 /usr/include/gtk-2.0/gdk/gdkkeysyms.h \
 /usr/include/gtk-2.0/gdk/gdkkeysyms-compat.h lazyfixed.h sysdep.h \
 vlazyfixed.h client.h game.h tiles.h tiles-enums.h player.h \
 player-enums.h protocol.h cmsg_union.h pmsg_union.h protocol-enums.h \
 game-enums.h version.h gtkrc.h
gui-dial.o: gui-dial.c gui.h /usr/include/gtk-2.0/gtk/gtk.h \
 /usr/include/gtk-2.0/gdk/gdk.h \
 /usr/include/gtk-2.0/gdk/gdkapplaunchcontext.h \
 /usr/include/glib-2.0/gio/gio.h /usr/include/glib-2.0/gio/giotypes.h \
 /usr/include/glib-2.0/gio/gioenums.h /usr/include/glib-2.0/glib-object.h \
 /usr/include/glib-2.0/gobject/gbinding.h /usr/include/glib-2.0/glib.h \
 /usr/include/glib-2.0/glib/galloca.h /usr/include/glib-2.0/glib/gtypes.h \
 /usr/lib/glib-2.0/include/glibconfig.h \
 /usr/include/glib-2.0/glib/gmacros.h /usr/include/glib-2.0/glib/garray.h \
 /usr/include/glib-2.0/glib/gasyncqueue.h \
 /usr/include/glib-2.0/glib/gthread.h /usr/include/glib-2.0/glib/gerror.h \
 /usr/include/glib-2.0/glib/gquark.h /usr/include/glib-2.0/glib/gutils.h \
 /usr/include/glib-2.0/glib/gatomic.h \
 /usr/include/glib-2.0/glib/gbacktrace.h \
 /usr/include/glib-2.0/glib/gbase64.h \
 /usr/include/glib-2.0/glib/gbitlock.h \
 /usr/include/glib-2.0/glib/gbookmarkfile.h \
 /usr/include/glib-2.0/glib/glist.h \
 /usr/include/glib-2.0/glib/gmem.h /usr/include/glib-2.0/glib/gslice.h \
 /usr/include/glib-2.0/glib/gchecksum.h \
 /usr/include/glib-2.0/glib/gconvert.h \
 /usr/include/glib-2.0/glib/gdataset.h /usr/include/glib-2.0/glib/gdate.h \
 /usr/include/glib-2.0/glib/gdatetime.h \
 /usr/include/glib-2.0/glib/gtimezone.h /usr/include/glib-2.0/glib/gdir.h \
 /usr/include/glib-2.0/glib/gfileutils.h \
 /usr/include/glib-2.0/glib/ghash.h /usr/include/glib-2.0/glib/ghook.h \
 /usr/include/glib-2.0/glib/ghostutils.h \
 /usr/include/glib-2.0/glib/giochannel.h \
 /usr/include/glib-2.0/glib/gmain.h /usr/include/glib-2.0/glib/gpoll.h \
 /usr/include/glib-2.0/glib/gslist.h /usr/include/glib-2.0/glib/gstring.h \
 /usr/include/glib-2.0/glib/gunicode.h \
 /usr/include/glib-2.0/glib/gkeyfile.h \
 /usr/include/glib-2.0/glib/gmappedfile.h \
 /usr/include/glib-2.0/glib/gmarkup.h \
 /usr/include/glib-2.0/glib/gmessages.h \
 /usr/include/glib-2.0/glib/gnode.h /usr/include/glib-2.0/glib/goption.h \
 /usr/include/glib-2.0/glib/gpattern.h \
 /usr/include/glib-2.0/glib/gprimes.h /usr/include/glib-2.0/glib/gqsort.h \
 /usr/include/glib-2.0/glib/gqueue.h /usr/include/glib-2.0/glib/grand.h \
 /usr/include/glib-2.0/glib/gregex.h \
 /usr/include/glib-2.0/glib/gscanner.h \
 /usr/include/glib-2.0/glib/gsequence.h \
 /usr/include/glib-2.0/glib/gshell.h /usr/include/glib-2.0/glib/gspawn.h \
 /usr/include/glib-2.0/glib/gstrfuncs.h \
 /usr/include/glib-2.0/glib/gtestutils.h \
 /usr/include/glib-2.0/glib/gthreadpool.h \
 /usr/include/glib-2.0/glib/gtimer.h /usr/include/glib-2.0/glib/gtree.h \
 /usr/include/glib-2.0/glib/gurifuncs.h \
 /usr/include/glib-2.0/glib/gvarianttype.h \
 /usr/include/glib-2.0/glib/gvariant.h \
 /usr/include/glib-2.0/gobject/gobject.h \
 /usr/include/glib-2.0/gobject/gtype.h \
 /usr/include/glib-2.0/gobject/gvalue.h \
 /usr/include/glib-2.0/gobject/gparam.h \
 /usr/include/glib-2.0/gobject/gclosure.h \
 /usr/include/glib-2.0/gobject/gsignal.h \
 /usr/include/glib-2.0/gobject/gmarshal.h \
 /usr/include/glib-2.0/gobject/gboxed.h \
 /usr/include/glib-2.0/gobject/genums.h \
 /usr/include/glib-2.0/gobject/gparamspecs.h \
 /usr/include/glib-2.0/gobject/gsourceclosure.h \
 /usr/include/glib-2.0/gobject/gtypemodule.h \
 /usr/include/glib-2.0/gobject/gtypeplugin.h \
 /usr/include/glib-2.0/gobject/gvaluearray.h \
 /usr/include/glib-2.0/gobject/gvaluetypes.h \
 /usr/include/glib-2.0/gio/gappinfo.h /usr/include/glib-2.0/gio/gaction.h \
 /usr/include/glib-2.0/gio/gsimpleaction.h \
 /usr/include/glib-2.0/gio/gactiongroup.h \
 /usr/include/glib-2.0/gio/gsimpleactiongroup.h \
 /usr/include/glib-2.0/gio/gactiongroup.h \
 /usr/include/glib-2.0/gio/gapplication.h \
 /usr/include/glib-2.0/gio/gapplicationcommandline.h \
 /usr/include/glib-2.0/gio/gasyncinitable.h \
 /usr/include/glib-2.0/gio/ginitable.h \
 /usr/include/glib-2.0/gio/gasyncresult.h \
 /usr/include/glib-2.0/gio/gbufferedinputstream.h \
 /usr/include/glib-2.0/gio/gfilterinputstream.h \
 /usr/include/glib-2.0/gio/ginputstream.h \
 /usr/include/glib-2.0/gio/gbufferedoutputstream.h \
 /usr/include/glib-2.0/gio/gfilteroutputstream.h \
 /usr/include/glib-2.0/gio/goutputstream.h \
 /usr/include/glib-2.0/gio/gcancellable.h \
 /usr/include/glib-2.0/gio/gcharsetconverter.h \
 /usr/include/glib-2.0/gio/gconverter.h \
 /usr/include/glib-2.0/gio/gcontenttype.h \
 /usr/include/glib-2.0/gio/gconverterinputstream.h \
 /usr/include/glib-2.0/gio/gconverteroutputstream.h \
 /usr/include/glib-2.0/gio/gcredentials.h \
 /usr/include/glib-2.0/gio/gdatainputstream.h \
 /usr/include/glib-2.0/gio/gdataoutputstream.h \
 /usr/include/glib-2.0/gio/gdbusaddress.h \
 /usr/include/glib-2.0/gio/gdbusauthobserver.h \
 /usr/include/glib-2.0/gio/gdbusconnection.h \
 /usr/include/glib-2.0/gio/gdbuserror.h \
 /usr/include/glib-2.0/gio/gdbusintrospection.h \
 /usr/include/glib-2.0/gio/gdbusmessage.h \
 /usr/include/glib-2.0/gio/gdbusmethodinvocation.h \
 /usr/include/glib-2.0/gio/gdbusnameowning.h \
 /usr/include/glib-2.0/gio/gdbusnamewatching.h \
 /usr/include/glib-2.0/gio/gdbusproxy.h \
 /usr/include/glib-2.0/gio/gdbusserver.h \
 /usr/include/glib-2.0/gio/gdbusutils.h \
 /usr/include/glib-2.0/gio/gdrive.h \
 /usr/include/glib-2.0/gio/gemblemedicon.h \
 /usr/include/glib-2.0/gio/gicon.h /usr/include/glib-2.0/gio/gemblem.h \
 /usr/include/glib-2.0/gio/gfileattribute.h \
 /usr/include/glib-2.0/gio/gfileenumerator.h \
 /usr/include/glib-2.0/gio/gfile.h /usr/include/glib-2.0/gio/gfileicon.h \
 /usr/include/glib-2.0/gio/gfileinfo.h \
 /usr/include/glib-2.0/gio/gfileinputstream.h \
 /usr/include/glib-2.0/gio/gfileiostream.h \
 /usr/include/glib-2.0/gio/giostream.h \
 /usr/include/glib-2.0/gio/gioerror.h \
 /usr/include/glib-2.0/gio/gfilemonitor.h \
 /usr/include/glib-2.0/gio/gfilenamecompleter.h \
 /usr/include/glib-2.0/gio/gfileoutputstream.h \
 /usr/include/glib-2.0/gio/ginetaddress.h \
 /usr/include/glib-2.0/gio/ginetsocketaddress.h \
 /usr/include/glib-2.0/gio/gsocketaddress.h \
 /usr/include/glib-2.0/gio/gioenumtypes.h \
 /usr/include/glib-2.0/gio/giomodule.h /usr/include/glib-2.0/gmodule.h \
 /usr/include/glib-2.0/gio/gioscheduler.h \
 /usr/include/glib-2.0/gio/gloadableicon.h \
 /usr/include/glib-2.0/gio/gmemoryinputstream.h \
 /usr/include/glib-2.0/gio/gmemoryoutputstream.h \
 /usr/include/glib-2.0/gio/gmount.h \
 /usr/include/glib-2.0/gio/gmountoperation.h \
 /usr/include/glib-2.0/gio/gnativevolumemonitor.h \
 /usr/include/glib-2.0/gio/gvolumemonitor.h \
 /usr/include/glib-2.0/gio/gnetworkaddress.h \
 /usr/include/glib-2.0/gio/gnetworkservice.h \
 /usr/include/glib-2.0/gio/gpermission.h \
 /usr/include/glib-2.0/gio/gpollableinputstream.h \
 /usr/include/glib-2.0/gio/gpollableoutputstream.h \
 /usr/include/glib-2.0/gio/gproxy.h \
 /usr/include/glib-2.0/gio/gproxyaddress.h \
 /usr/include/glib-2.0/gio/gproxyaddressenumerator.h \
 /usr/include/glib-2.0/gio/gsocketaddressenumerator.h \
 /usr/include/glib-2.0/gio/gproxyresolver.h \
 /usr/include/glib-2.0/gio/gresolver.h \
 /usr/include/glib-2.0/gio/gseekable.h \
 /usr/include/glib-2.0/gio/gsettings.h \
 /usr/include/glib-2.0/gio/gsimpleasyncresult.h \
 /usr/include/glib-2.0/gio/gsimplepermission.h \
 /usr/include/glib-2.0/gio/gsocketclient.h \
 /usr/include/glib-2.0/gio/gsocketconnectable.h \
 /usr/include/glib-2.0/gio/gsocketconnection.h \
 /usr/include/glib-2.0/gio/gsocket.h \
 /usr/include/glib-2.0/gio/gsocketcontrolmessage.h \
 /usr/include/glib-2.0/gio/gsocketlistener.h \
 /usr/include/glib-2.0/gio/gsocketservice.h \
 /usr/include/glib-2.0/gio/gsrvtarget.h \
 /usr/include/glib-2.0/gio/gtcpconnection.h \
 /usr/include/glib-2.0/gio/gtcpwrapperconnection.h \
 /usr/include/glib-2.0/gio/gthemedicon.h \
 /usr/include/glib-2.0/gio/gthreadedsocketservice.h \
 /usr/include/glib-2.0/gio/gtlsbackend.h \
 /usr/include/glib-2.0/gio/gtlscertificate.h \
 /usr/include/glib-2.0/gio/gtlsclientconnection.h \
 /usr/include/glib-2.0/gio/gtlsconnection.h \
 /usr/include/glib-2.0/gio/gtlsserverconnection.h \
 /usr/include/glib-2.0/gio/gvfs.h /usr/include/glib-2.0/gio/gvolume.h \
 /usr/include/glib-2.0/gio/gzlibcompressor.h \
 /usr/include/glib-2.0/gio/gzlibdecompressor.h \
 /usr/include/gtk-2.0/gdk/gdkscreen.h /usr/include/cairo/cairo.h \
 /usr/include/cairo/cairo-version.h /usr/include/cairo/cairo-features.h \
 /usr/include/cairo/cairo-deprecated.h \
 /usr/include/gtk-2.0/gdk/gdktypes.h /usr/include/pango-1.0/pango/pango.h \
 /usr/include/pango-1.0/pango/pango-attributes.h \
 /usr/include/pango-1.0/pango/pango-font.h \
 /usr/include/pango-1.0/pango/pango-coverage.h \
 /usr/include/pango-1.0/pango/pango-types.h \
 /usr/include/pango-1.0/pango/pango-gravity.h \
 /usr/include/pango-1.0/pango/pango-matrix.h \
 /usr/include/pango-1.0/pango/pango-script.h \
 /usr/include/pango-1.0/pango/pango-language.h \
 /usr/include/pango-1.0/pango/pango-bidi-type.h \
 /usr/include/pango-1.0/pango/pango-break.h \
 /usr/include/pango-1.0/pango/pango-item.h \
 /usr/include/pango-1.0/pango/pango-context.h \
 /usr/include/pango-1.0/pango/pango-fontmap.h \
 /usr/include/pango-1.0/pango/pango-fontset.h \
 /usr/include/pango-1.0/pango/pango-engine.h \
 /usr/include/pango-1.0/pango/pango-glyph.h \
 /usr/include/pango-1.0/pango/pango-enum-types.h \
 /usr/include/pango-1.0/pango/pango-features.h \
 /usr/include/pango-1.0/pango/pango-glyph-item.h \
 /usr/include/pango-1.0/pango/pango-layout.h \
 /usr/include/pango-1.0/pango/pango-tabs.h \
 /usr/include/pango-1.0/pango/pango-renderer.h \
 /usr/include/pango-1.0/pango/pango-utils.h \
 /usr/lib/gtk-2.0/include/gdkconfig.h \
 /usr/include/gtk-2.0/gdk/gdkdisplay.h \
 /usr/include/gtk-2.0/gdk/gdkevents.h /usr/include/gtk-2.0/gdk/gdkcolor.h \
 /usr/include/gtk-2.0/gdk/gdkdnd.h /usr/include/gtk-2.0/gdk/gdkinput.h \
 /usr/include/gtk-2.0/gdk/gdkcairo.h /usr/include/gtk-2.0/gdk/gdkpixbuf.h \
 /usr/include/gtk-2.0/gdk/gdkrgb.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-features.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-core.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-transform.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-animation.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-simple-anim.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-io.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-loader.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-enum-types.h \
 /usr/include/pango-1.0/pango/pangocairo.h \
 /usr/include/gtk-2.0/gdk/gdkcursor.h \
 /usr/include/gtk-2.0/gdk/gdkdisplaymanager.h \
 /usr/include/gtk-2.0/gdk/gdkdrawable.h /usr/include/gtk-2.0/gdk/gdkgc.h \
 /usr/include/gtk-2.0/gdk/gdkenumtypes.h \
 /usr/include/gtk-2.0/gdk/gdkfont.h /usr/include/gtk-2.0/gdk/gdkimage.h \
 /usr/include/gtk-2.0/gdk/gdkkeys.h /usr/include/gtk-2.0/gdk/gdkpango.h \
 /usr/include/gtk-2.0/gdk/gdkpixmap.h \
 /usr/include/gtk-2.0/gdk/gdkproperty.h \
 /usr/include/gtk-2.0/gdk/gdkregion.h \
 /usr/include/gtk-2.0/gdk/gdkselection.h \
 /usr/include/gtk-2.0/gdk/gdkspawn.h \
 /usr/include/gtk-2.0/gdk/gdktestutils.h \
 /usr/include/gtk-2.0/gdk/gdkwindow.h \
 /usr/include/gtk-2.0/gdk/gdkvisual.h \
 /usr/include/gtk-2.0/gtk/gtkaboutdialog.h \
 /usr/include/gtk-2.0/gtk/gtkdialog.h \
 /usr/include/gtk-2.0/gtk/gtkwindow.h \
 /usr/include/gtk-2.0/gtk/gtkaccelgroup.h \
 /usr/include/gtk-2.0/gtk/gtkenums.h /usr/include/gtk-2.0/gtk/gtkbin.h \
 /usr/include/gtk-2.0/gtk/gtkcontainer.h \
 /usr/include/gtk-2.0/gtk/gtkwidget.h \
 /usr/include/gtk-2.0/gtk/gtkobject.h \
 /usr/include/gtk-2.0/gtk/gtktypeutils.h \
 /usr/include/gtk-2.0/gtk/gtktypebuiltins.h \
 /usr/include/gtk-2.0/gtk/gtkdebug.h \
 /usr/include/gtk-2.0/gtk/gtkadjustment.h \
 /usr/include/gtk-2.0/gtk/gtkstyle.h \
 /usr/include/gtk-2.0/gtk/gtksettings.h /usr/include/gtk-2.0/gtk/gtkrc.h \
 /usr/include/atk-1.0/atk/atk.h /usr/include/atk-1.0/atk/atkobject.h \
 /usr/include/atk-1.0/atk/atkstate.h \
 /usr/include/atk-1.0/atk/atkrelationtype.h \
 /usr/include/atk-1.0/atk/atkaction.h \
 /usr/include/atk-1.0/atk/atkcomponent.h \
 /usr/include/atk-1.0/atk/atkutil.h \
 /usr/include/atk-1.0/atk/atkdocument.h \
 /usr/include/atk-1.0/atk/atkeditabletext.h \
 /usr/include/atk-1.0/atk/atktext.h \
 /usr/include/atk-1.0/atk/atkgobjectaccessible.h \
 /usr/include/atk-1.0/atk/atkhyperlink.h \
 /usr/include/atk-1.0/atk/atkhyperlinkimpl.h \
 /usr/include/atk-1.0/atk/atkhypertext.h \
 /usr/include/atk-1.0/atk/atkimage.h \
 /usr/include/atk-1.0/atk/atknoopobject.h \
 /usr/include/atk-1.0/atk/atknoopobjectfactory.h \
 /usr/include/atk-1.0/atk/atkobjectfactory.h \
 /usr/include/atk-1.0/atk/atkplug.h \
 /usr/include/atk-1.0/atk/atkregistry.h \
 /usr/include/atk-1.0/atk/atkobjectfactory.h \
 /usr/include/atk-1.0/atk/atkrelation.h \
 /usr/include/atk-1.0/atk/atkrelationset.h \
 /usr/include/atk-1.0/atk/atkselection.h \
 /usr/include/atk-1.0/atk/atksocket.h \
 /usr/include/atk-1.0/atk/atkstateset.h \
 /usr/include/atk-1.0/atk/atkstreamablecontent.h \
 /usr/include/atk-1.0/atk/atktable.h /usr/include/atk-1.0/atk/atkmisc.h \
 /usr/include/atk-1.0/atk/atkvalue.h \
 /usr/include/gtk-2.0/gtk/gtkaccellabel.h \
 /usr/include/gtk-2.0/gtk/gtklabel.h /usr/include/gtk-2.0/gtk/gtkmisc.h \
 /usr/include/gtk-2.0/gtk/gtkmenu.h \
 /usr/include/gtk-2.0/gtk/gtkmenushell.h \
 /usr/include/gtk-2.0/gtk/gtkaccelmap.h \
 /usr/include/gtk-2.0/gtk/gtkaccessible.h \
 /usr/include/gtk-2.0/gtk/gtkaction.h \
 /usr/include/gtk-2.0/gtk/gtkactiongroup.h \
 /usr/include/gtk-2.0/gtk/gtkactivatable.h \
 /usr/include/gtk-2.0/gtk/gtkalignment.h \
 /usr/include/gtk-2.0/gtk/gtkarrow.h \
 /usr/include/gtk-2.0/gtk/gtkaspectframe.h \
 /usr/include/gtk-2.0/gtk/gtkframe.h \
 /usr/include/gtk-2.0/gtk/gtkassistant.h \
 /usr/include/gtk-2.0/gtk/gtkbbox.h /usr/include/gtk-2.0/gtk/gtkbox.h \
 /usr/include/gtk-2.0/gtk/gtkbindings.h \
 /usr/include/gtk-2.0/gtk/gtkbuildable.h \
 /usr/include/gtk-2.0/gtk/gtkbuilder.h \
 /usr/include/gtk-2.0/gtk/gtkbutton.h /usr/include/gtk-2.0/gtk/gtkimage.h \
 /usr/include/gtk-2.0/gtk/gtkcalendar.h \
 /usr/include/gtk-2.0/gtk/gtksignal.h \
 /usr/include/gtk-2.0/gtk/gtkmarshal.h \
 /usr/include/gtk-2.0/gtk/gtkcelleditable.h \
 /usr/include/gtk-2.0/gtk/gtkcelllayout.h \
 /usr/include/gtk-2.0/gtk/gtkcellrenderer.h \
 /usr/include/gtk-2.0/gtk/gtktreeviewcolumn.h \
 /usr/include/gtk-2.0/gtk/gtktreemodel.h \
 /usr/include/gtk-2.0/gtk/gtktreesortable.h \
 /usr/include/gtk-2.0/gtk/gtkcellrendereraccel.h \
 /usr/include/gtk-2.0/gtk/gtkcellrenderertext.h \
 /usr/include/gtk-2.0/gtk/gtkcellrenderercombo.h \
 /usr/include/gtk-2.0/gtk/gtkcellrendererpixbuf.h \
 /usr/include/gtk-2.0/gtk/gtkcellrendererprogress.h \
 /usr/include/gtk-2.0/gtk/gtkcellrendererspin.h \
 /usr/include/gtk-2.0/gtk/gtkcellrendererspinner.h \
 /usr/include/gtk-2.0/gtk/gtkcellrenderertoggle.h \
 /usr/include/gtk-2.0/gtk/gtkcellview.h \
 /usr/include/gtk-2.0/gtk/gtkcheckbutton.h \
 /usr/include/gtk-2.0/gtk/gtktogglebutton.h \
 /usr/include/gtk-2.0/gtk/gtkcheckmenuitem.h \
 /usr/include/gtk-2.0/gtk/gtkmenuitem.h \
 /usr/include/gtk-2.0/gtk/gtkitem.h \
 /usr/include/gtk-2.0/gtk/gtkclipboard.h \
 /usr/include/gtk-2.0/gtk/gtkselection.h \
 /usr/include/gtk-2.0/gtk/gtktextiter.h \
 /usr/include/gtk-2.0/gtk/gtktexttag.h \
 /usr/include/gtk-2.0/gtk/gtktextchild.h \
 /usr/include/gtk-2.0/gtk/gtkcolorbutton.h \
 /usr/include/gtk-2.0/gtk/gtkcolorsel.h \
 /usr/include/gtk-2.0/gtk/gtkvbox.h \
 /usr/include/gtk-2.0/gtk/gtkcolorseldialog.h \
 /usr/include/gtk-2.0/gtk/gtkcombobox.h \
 /usr/include/gtk-2.0/gtk/gtktreeview.h /usr/include/gtk-2.0/gtk/gtkdnd.h \
 /usr/include/gtk-2.0/gtk/gtkentry.h \
 /usr/include/gtk-2.0/gtk/gtkeditable.h \
 /usr/include/gtk-2.0/gtk/gtkimcontext.h \
 /usr/include/gtk-2.0/gtk/gtkentrybuffer.h \
 /usr/include/gtk-2.0/gtk/gtkentrycompletion.h \
 /usr/include/gtk-2.0/gtk/gtkliststore.h \
 /usr/include/gtk-2.0/gtk/gtktreemodelfilter.h \
 /usr/include/gtk-2.0/gtk/gtkcomboboxentry.h \
 /usr/include/gtk-2.0/gtk/gtkdrawingarea.h \
 /usr/include/gtk-2.0/gtk/gtkeventbox.h \
 /usr/include/gtk-2.0/gtk/gtkexpander.h \
 /usr/include/gtk-2.0/gtk/gtkfixed.h \
 /usr/include/gtk-2.0/gtk/gtkfilechooser.h \
 /usr/include/gtk-2.0/gtk/gtkfilefilter.h \
 /usr/include/gtk-2.0/gtk/gtkfilechooserbutton.h \
 /usr/include/gtk-2.0/gtk/gtkhbox.h \
 /usr/include/gtk-2.0/gtk/gtkfilechooserdialog.h \
 /usr/include/gtk-2.0/gtk/gtkfilechooserwidget.h \
 /usr/include/gtk-2.0/gtk/gtkfontbutton.h \
 /usr/include/gtk-2.0/gtk/gtkfontsel.h /usr/include/gtk-2.0/gtk/gtkgc.h \
 /usr/include/gtk-2.0/gtk/gtkhandlebox.h \
 /usr/include/gtk-2.0/gtk/gtkhbbox.h /usr/include/gtk-2.0/gtk/gtkhpaned.h \
 /usr/include/gtk-2.0/gtk/gtkpaned.h /usr/include/gtk-2.0/gtk/gtkhruler.h \
 /usr/include/gtk-2.0/gtk/gtkruler.h /usr/include/gtk-2.0/gtk/gtkhscale.h \
 /usr/include/gtk-2.0/gtk/gtkscale.h /usr/include/gtk-2.0/gtk/gtkrange.h \
 /usr/include/gtk-2.0/gtk/gtkhscrollbar.h \
 /usr/include/gtk-2.0/gtk/gtkscrollbar.h \
 /usr/include/gtk-2.0/gtk/gtkhseparator.h \
 /usr/include/gtk-2.0/gtk/gtkseparator.h \
 /usr/include/gtk-2.0/gtk/gtkhsv.h \
 /usr/include/gtk-2.0/gtk/gtkiconfactory.h \
 /usr/include/gtk-2.0/gtk/gtkicontheme.h \
 /usr/include/gtk-2.0/gtk/gtkiconview.h \
 /usr/include/gtk-2.0/gtk/gtktooltip.h \
 /usr/include/gtk-2.0/gtk/gtkimagemenuitem.h \
 /usr/include/gtk-2.0/gtk/gtkimcontextsimple.h \
 /usr/include/gtk-2.0/gtk/gtkimmulticontext.h \
 /usr/include/gtk-2.0/gtk/gtkinfobar.h \
 /usr/include/gtk-2.0/gtk/gtkinvisible.h \
 /usr/include/gtk-2.0/gtk/gtklayout.h \
 /usr/include/gtk-2.0/gtk/gtklinkbutton.h \
 /usr/include/gtk-2.0/gtk/gtkmain.h /usr/include/gtk-2.0/gtk/gtkmenubar.h \
 /usr/include/gtk-2.0/gtk/gtkmenutoolbutton.h \
 /usr/include/gtk-2.0/gtk/gtktoolbutton.h \
 /usr/include/gtk-2.0/gtk/gtktoolitem.h \
 /usr/include/gtk-2.0/gtk/gtktooltips.h \
 /usr/include/gtk-2.0/gtk/gtksizegroup.h \
 /usr/include/gtk-2.0/gtk/gtkmessagedialog.h \
 /usr/include/gtk-2.0/gtk/gtkmodules.h \
 /usr/include/gtk-2.0/gtk/gtkmountoperation.h \
 /usr/include/gtk-2.0/gtk/gtknotebook.h \
 /usr/include/gtk-2.0/gtk/gtkoffscreenwindow.h \
 /usr/include/gtk-2.0/gtk/gtkorientable.h \
 /usr/include/gtk-2.0/gtk/gtkpagesetup.h \
 /usr/include/gtk-2.0/gtk/gtkpapersize.h \
 /usr/include/gtk-2.0/gtk/gtkplug.h /usr/include/gtk-2.0/gtk/gtksocket.h \
 /usr/include/gtk-2.0/gtk/gtkprintcontext.h \
 /usr/include/gtk-2.0/gtk/gtkprintoperation.h \
 /usr/include/gtk-2.0/gtk/gtkprintsettings.h \
 /usr/include/gtk-2.0/gtk/gtkprintoperationpreview.h \
 /usr/include/gtk-2.0/gtk/gtkprogressbar.h \
 /usr/include/gtk-2.0/gtk/gtkprogress.h \
 /usr/include/gtk-2.0/gtk/gtkradioaction.h \
 /usr/include/gtk-2.0/gtk/gtktoggleaction.h \
 /usr/include/gtk-2.0/gtk/gtkradiobutton.h \
 /usr/include/gtk-2.0/gtk/gtkradiomenuitem.h \
 /usr/include/gtk-2.0/gtk/gtkradiotoolbutton.h \
 /usr/include/gtk-2.0/gtk/gtktoggletoolbutton.h \
 /usr/include/gtk-2.0/gtk/gtkrecentaction.h \
 /usr/include/gtk-2.0/gtk/gtkrecentmanager.h \
 /usr/include/gtk-2.0/gtk/gtkrecentchooser.h \
 /usr/include/gtk-2.0/gtk/gtkrecentfilter.h \
 /usr/include/gtk-2.0/gtk/gtkrecentchooserdialog.h \
 /usr/include/gtk-2.0/gtk/gtkrecentchoosermenu.h \
 /usr/include/gtk-2.0/gtk/gtkrecentchooserwidget.h \
 /usr/include/gtk-2.0/gtk/gtkscalebutton.h \
 /usr/include/gtk-2.0/gtk/gtkscrolledwindow.h \
 /usr/include/gtk-2.0/gtk/gtkvscrollbar.h \
 /usr/include/gtk-2.0/gtk/gtkviewport.h \
 /usr/include/gtk-2.0/gtk/gtkseparatormenuitem.h \
 /usr/include/gtk-2.0/gtk/gtkseparatortoolitem.h \
 /usr/include/gtk-2.0/gtk/gtkshow.h \
 /usr/include/gtk-2.0/gtk/gtkspinbutton.h \
 /usr/include/gtk-2.0/gtk/gtkspinner.h \
 /usr/include/gtk-2.0/gtk/gtkstatusbar.h \
 /usr/include/gtk-2.0/gtk/gtkstatusicon.h \
 /usr/include/gtk-2.0/gtk/gtkstock.h /usr/include/gtk-2.0/gtk/gtktable.h \
 /usr/include/gtk-2.0/gtk/gtktearoffmenuitem.h \
 /usr/include/gtk-2.0/gtk/gtktextbuffer.h \
 /usr/include/gtk-2.0/gtk/gtktexttagtable.h \
 /usr/include/gtk-2.0/gtk/gtktextmark.h \
 /usr/include/gtk-2.0/gtk/gtktextbufferrichtext.h \
 /usr/include/gtk-2.0/gtk/gtktextview.h \
 /usr/include/gtk-2.0/gtk/gtktoolbar.h \
 /usr/include/gtk-2.0/gtk/gtkpixmap.h \
 /usr/include/gtk-2.0/gtk/gtktoolitemgroup.h \
 /usr/include/gtk-2.0/gtk/gtktoolpalette.h \
 /usr/include/gtk-2.0/gtk/gtktoolshell.h \
 /usr/include/gtk-2.0/gtk/gtktestutils.h \
 /usr/include/gtk-2.0/gtk/gtktreednd.h \
 /usr/include/gtk-2.0/gtk/gtktreemodelsort.h \
 /usr/include/gtk-2.0/gtk/gtktreeselection.h \
 /usr/include/gtk-2.0/gtk/gtktreestore.h \
 /usr/include/gtk-2.0/gtk/gtkuimanager.h \
 /usr/include/gtk-2.0/gtk/gtkvbbox.h \
 /usr/include/gtk-2.0/gtk/gtkversion.h \
 /usr/include/gtk-2.0/gtk/gtkvolumebutton.h \
 /usr/include/gtk-2.0/gtk/gtkvpaned.h \
 /usr/include/gtk-2.0/gtk/gtkvruler.h \
 /usr/include/gtk-2.0/gtk/gtkvscale.h \
 /usr/include/gtk-2.0/gtk/gtkvseparator.h \
 /usr/include/gtk-2.0/gtk/gtktext.h /usr/include/gtk-2.0/gtk/gtktree.h \
 /usr/include/gtk-2.0/gtk/gtktreeitem.h \
 /usr/include/gtk-2.0/gtk/gtkclist.h /usr/include/gtk-2.0/gtk/gtkcombo.h \
 /usr/include/gtk-2.0/gtk/gtkctree.h /usr/include/gtk-2.0/gtk/gtkcurve.h \
 /usr/include/gtk-2.0/gtk/gtkfilesel.h \
 /usr/include/gtk-2.0/gtk/gtkgamma.h \
 /usr/include/gtk-2.0/gtk/gtkinputdialog.h \
 /usr/include/gtk-2.0/gtk/gtkitemfactory.h \
 /usr/include/gtk-2.0/gtk/gtklist.h \
 /usr/include/gtk-2.0/gtk/gtklistitem.h \
 /usr/include/gtk-2.0/gtk/gtkoldeditable.h \
 /usr/include/gtk-2.0/gtk/gtkoptionmenu.h \
 /usr/include/gtk-2.0/gtk/gtkpreview.h \
 /usr/include/gtk-2.0/gtk/gtktipsquery.h \
 /usr/include/gtk-2.0/gdk/gdkkeysyms.h \
 /usr/include/gtk-2.0/gdk/gdkkeysyms-compat.h lazyfixed.h sysdep.h \
 vlazyfixed.h client.h game.h tiles.h tiles-enums.h player.h \
 player-enums.h protocol.h cmsg_union.h pmsg_union.h protocol-enums.h \
 game-enums.h version.h
lazyfixed.o: lazyfixed.c lazyfixed.h /usr/include/gtk-2.0/gtk/gtkfixed.h \
 /usr/include/gtk-2.0/gtk/gtkcontainer.h \
 /usr/include/gtk-2.0/gtk/gtkwidget.h /usr/include/gtk-2.0/gdk/gdk.h \
 /usr/include/gtk-2.0/gdk/gdkapplaunchcontext.h \
 /usr/include/glib-2.0/gio/gio.h /usr/include/glib-2.0/gio/giotypes.h \
 /usr/include/glib-2.0/gio/gioenums.h /usr/include/glib-2.0/glib-object.h \
 /usr/include/glib-2.0/gobject/gbinding.h /usr/include/glib-2.0/glib.h \
 /usr/include/glib-2.0/glib/galloca.h /usr/include/glib-2.0/glib/gtypes.h \
 /usr/lib/glib-2.0/include/glibconfig.h \
 /usr/include/glib-2.0/glib/gmacros.h /usr/include/glib-2.0/glib/garray.h \
 /usr/include/glib-2.0/glib/gasyncqueue.h \
 /usr/include/glib-2.0/glib/gthread.h /usr/include/glib-2.0/glib/gerror.h \
 /usr/include/glib-2.0/glib/gquark.h /usr/include/glib-2.0/glib/gutils.h \
 /usr/include/glib-2.0/glib/gatomic.h \
 /usr/include/glib-2.0/glib/gbacktrace.h \
 /usr/include/glib-2.0/glib/gbase64.h \
 /usr/include/glib-2.0/glib/gbitlock.h \
 /usr/include/glib-2.0/glib/gbookmarkfile.h \
 /usr/include/glib-2.0/glib/glist.h \
 /usr/include/glib-2.0/glib/gmem.h /usr/include/glib-2.0/glib/gslice.h \
 /usr/include/glib-2.0/glib/gchecksum.h \
 /usr/include/glib-2.0/glib/gconvert.h \
 /usr/include/glib-2.0/glib/gdataset.h /usr/include/glib-2.0/glib/gdate.h \
 /usr/include/glib-2.0/glib/gdatetime.h \
 /usr/include/glib-2.0/glib/gtimezone.h /usr/include/glib-2.0/glib/gdir.h \
 /usr/include/glib-2.0/glib/gfileutils.h \
 /usr/include/glib-2.0/glib/ghash.h /usr/include/glib-2.0/glib/ghook.h \
 /usr/include/glib-2.0/glib/ghostutils.h \
 /usr/include/glib-2.0/glib/giochannel.h \
 /usr/include/glib-2.0/glib/gmain.h /usr/include/glib-2.0/glib/gpoll.h \
 /usr/include/glib-2.0/glib/gslist.h /usr/include/glib-2.0/glib/gstring.h \
 /usr/include/glib-2.0/glib/gunicode.h \
 /usr/include/glib-2.0/glib/gkeyfile.h \
 /usr/include/glib-2.0/glib/gmappedfile.h \
 /usr/include/glib-2.0/glib/gmarkup.h \
 /usr/include/glib-2.0/glib/gmessages.h \
 /usr/include/glib-2.0/glib/gnode.h /usr/include/glib-2.0/glib/goption.h \
 /usr/include/glib-2.0/glib/gpattern.h \
 /usr/include/glib-2.0/glib/gprimes.h /usr/include/glib-2.0/glib/gqsort.h \
 /usr/include/glib-2.0/glib/gqueue.h /usr/include/glib-2.0/glib/grand.h \
 /usr/include/glib-2.0/glib/gregex.h \
 /usr/include/glib-2.0/glib/gscanner.h \
 /usr/include/glib-2.0/glib/gsequence.h \
 /usr/include/glib-2.0/glib/gshell.h /usr/include/glib-2.0/glib/gspawn.h \
 /usr/include/glib-2.0/glib/gstrfuncs.h \
 /usr/include/glib-2.0/glib/gtestutils.h \
 /usr/include/glib-2.0/glib/gthreadpool.h \
 /usr/include/glib-2.0/glib/gtimer.h /usr/include/glib-2.0/glib/gtree.h \
 /usr/include/glib-2.0/glib/gurifuncs.h \
 /usr/include/glib-2.0/glib/gvarianttype.h \
 /usr/include/glib-2.0/glib/gvariant.h \
 /usr/include/glib-2.0/gobject/gobject.h \
 /usr/include/glib-2.0/gobject/gtype.h \
 /usr/include/glib-2.0/gobject/gvalue.h \
 /usr/include/glib-2.0/gobject/gparam.h \
 /usr/include/glib-2.0/gobject/gclosure.h \
 /usr/include/glib-2.0/gobject/gsignal.h \
 /usr/include/glib-2.0/gobject/gmarshal.h \
 /usr/include/glib-2.0/gobject/gboxed.h \
 /usr/include/glib-2.0/gobject/genums.h \
 /usr/include/glib-2.0/gobject/gparamspecs.h \
 /usr/include/glib-2.0/gobject/gsourceclosure.h \
 /usr/include/glib-2.0/gobject/gtypemodule.h \
 /usr/include/glib-2.0/gobject/gtypeplugin.h \
 /usr/include/glib-2.0/gobject/gvaluearray.h \
 /usr/include/glib-2.0/gobject/gvaluetypes.h \
 /usr/include/glib-2.0/gio/gappinfo.h /usr/include/glib-2.0/gio/gaction.h \
 /usr/include/glib-2.0/gio/gsimpleaction.h \
 /usr/include/glib-2.0/gio/gactiongroup.h \
 /usr/include/glib-2.0/gio/gsimpleactiongroup.h \
 /usr/include/glib-2.0/gio/gactiongroup.h \
 /usr/include/glib-2.0/gio/gapplication.h \
 /usr/include/glib-2.0/gio/gapplicationcommandline.h \
 /usr/include/glib-2.0/gio/gasyncinitable.h \
 /usr/include/glib-2.0/gio/ginitable.h \
 /usr/include/glib-2.0/gio/gasyncresult.h \
 /usr/include/glib-2.0/gio/gbufferedinputstream.h \
 /usr/include/glib-2.0/gio/gfilterinputstream.h \
 /usr/include/glib-2.0/gio/ginputstream.h \
 /usr/include/glib-2.0/gio/gbufferedoutputstream.h \
 /usr/include/glib-2.0/gio/gfilteroutputstream.h \
 /usr/include/glib-2.0/gio/goutputstream.h \
 /usr/include/glib-2.0/gio/gcancellable.h \
 /usr/include/glib-2.0/gio/gcharsetconverter.h \
 /usr/include/glib-2.0/gio/gconverter.h \
 /usr/include/glib-2.0/gio/gcontenttype.h \
 /usr/include/glib-2.0/gio/gconverterinputstream.h \
 /usr/include/glib-2.0/gio/gconverteroutputstream.h \
 /usr/include/glib-2.0/gio/gcredentials.h \
 /usr/include/glib-2.0/gio/gdatainputstream.h \
 /usr/include/glib-2.0/gio/gdataoutputstream.h \
 /usr/include/glib-2.0/gio/gdbusaddress.h \
 /usr/include/glib-2.0/gio/gdbusauthobserver.h \
 /usr/include/glib-2.0/gio/gdbusconnection.h \
 /usr/include/glib-2.0/gio/gdbuserror.h \
 /usr/include/glib-2.0/gio/gdbusintrospection.h \
 /usr/include/glib-2.0/gio/gdbusmessage.h \
 /usr/include/glib-2.0/gio/gdbusmethodinvocation.h \
 /usr/include/glib-2.0/gio/gdbusnameowning.h \
 /usr/include/glib-2.0/gio/gdbusnamewatching.h \
 /usr/include/glib-2.0/gio/gdbusproxy.h \
 /usr/include/glib-2.0/gio/gdbusserver.h \
 /usr/include/glib-2.0/gio/gdbusutils.h \
 /usr/include/glib-2.0/gio/gdrive.h \
 /usr/include/glib-2.0/gio/gemblemedicon.h \
 /usr/include/glib-2.0/gio/gicon.h /usr/include/glib-2.0/gio/gemblem.h \
 /usr/include/glib-2.0/gio/gfileattribute.h \
 /usr/include/glib-2.0/gio/gfileenumerator.h \
 /usr/include/glib-2.0/gio/gfile.h /usr/include/glib-2.0/gio/gfileicon.h \
 /usr/include/glib-2.0/gio/gfileinfo.h \
 /usr/include/glib-2.0/gio/gfileinputstream.h \
 /usr/include/glib-2.0/gio/gfileiostream.h \
 /usr/include/glib-2.0/gio/giostream.h \
 /usr/include/glib-2.0/gio/gioerror.h \
 /usr/include/glib-2.0/gio/gfilemonitor.h \
 /usr/include/glib-2.0/gio/gfilenamecompleter.h \
 /usr/include/glib-2.0/gio/gfileoutputstream.h \
 /usr/include/glib-2.0/gio/ginetaddress.h \
 /usr/include/glib-2.0/gio/ginetsocketaddress.h \
 /usr/include/glib-2.0/gio/gsocketaddress.h \
 /usr/include/glib-2.0/gio/gioenumtypes.h \
 /usr/include/glib-2.0/gio/giomodule.h /usr/include/glib-2.0/gmodule.h \
 /usr/include/glib-2.0/gio/gioscheduler.h \
 /usr/include/glib-2.0/gio/gloadableicon.h \
 /usr/include/glib-2.0/gio/gmemoryinputstream.h \
 /usr/include/glib-2.0/gio/gmemoryoutputstream.h \
 /usr/include/glib-2.0/gio/gmount.h \
 /usr/include/glib-2.0/gio/gmountoperation.h \
 /usr/include/glib-2.0/gio/gnativevolumemonitor.h \
 /usr/include/glib-2.0/gio/gvolumemonitor.h \
 /usr/include/glib-2.0/gio/gnetworkaddress.h \
 /usr/include/glib-2.0/gio/gnetworkservice.h \
 /usr/include/glib-2.0/gio/gpermission.h \
 /usr/include/glib-2.0/gio/gpollableinputstream.h \
 /usr/include/glib-2.0/gio/gpollableoutputstream.h \
 /usr/include/glib-2.0/gio/gproxy.h \
 /usr/include/glib-2.0/gio/gproxyaddress.h \
 /usr/include/glib-2.0/gio/gproxyaddressenumerator.h \
 /usr/include/glib-2.0/gio/gsocketaddressenumerator.h \
 /usr/include/glib-2.0/gio/gproxyresolver.h \
 /usr/include/glib-2.0/gio/gresolver.h \
 /usr/include/glib-2.0/gio/gseekable.h \
 /usr/include/glib-2.0/gio/gsettings.h \
 /usr/include/glib-2.0/gio/gsimpleasyncresult.h \
 /usr/include/glib-2.0/gio/gsimplepermission.h \
 /usr/include/glib-2.0/gio/gsocketclient.h \
 /usr/include/glib-2.0/gio/gsocketconnectable.h \
 /usr/include/glib-2.0/gio/gsocketconnection.h \
 /usr/include/glib-2.0/gio/gsocket.h \
 /usr/include/glib-2.0/gio/gsocketcontrolmessage.h \
 /usr/include/glib-2.0/gio/gsocketlistener.h \
 /usr/include/glib-2.0/gio/gsocketservice.h \
 /usr/include/glib-2.0/gio/gsrvtarget.h \
 /usr/include/glib-2.0/gio/gtcpconnection.h \
 /usr/include/glib-2.0/gio/gtcpwrapperconnection.h \
 /usr/include/glib-2.0/gio/gthemedicon.h \
 /usr/include/glib-2.0/gio/gthreadedsocketservice.h \
 /usr/include/glib-2.0/gio/gtlsbackend.h \
 /usr/include/glib-2.0/gio/gtlscertificate.h \
 /usr/include/glib-2.0/gio/gtlsclientconnection.h \
 /usr/include/glib-2.0/gio/gtlsconnection.h \
 /usr/include/glib-2.0/gio/gtlsserverconnection.h \
 /usr/include/glib-2.0/gio/gvfs.h /usr/include/glib-2.0/gio/gvolume.h \
 /usr/include/glib-2.0/gio/gzlibcompressor.h \
 /usr/include/glib-2.0/gio/gzlibdecompressor.h \
 /usr/include/gtk-2.0/gdk/gdkscreen.h /usr/include/cairo/cairo.h \
 /usr/include/cairo/cairo-version.h /usr/include/cairo/cairo-features.h \
 /usr/include/cairo/cairo-deprecated.h \
 /usr/include/gtk-2.0/gdk/gdktypes.h /usr/include/pango-1.0/pango/pango.h \
 /usr/include/pango-1.0/pango/pango-attributes.h \
 /usr/include/pango-1.0/pango/pango-font.h \
 /usr/include/pango-1.0/pango/pango-coverage.h \
 /usr/include/pango-1.0/pango/pango-types.h \
 /usr/include/pango-1.0/pango/pango-gravity.h \
 /usr/include/pango-1.0/pango/pango-matrix.h \
 /usr/include/pango-1.0/pango/pango-script.h \
 /usr/include/pango-1.0/pango/pango-language.h \
 /usr/include/pango-1.0/pango/pango-bidi-type.h \
 /usr/include/pango-1.0/pango/pango-break.h \
 /usr/include/pango-1.0/pango/pango-item.h \
 /usr/include/pango-1.0/pango/pango-context.h \
 /usr/include/pango-1.0/pango/pango-fontmap.h \
 /usr/include/pango-1.0/pango/pango-fontset.h \
 /usr/include/pango-1.0/pango/pango-engine.h \
 /usr/include/pango-1.0/pango/pango-glyph.h \
 /usr/include/pango-1.0/pango/pango-enum-types.h \
 /usr/include/pango-1.0/pango/pango-features.h \
 /usr/include/pango-1.0/pango/pango-glyph-item.h \
 /usr/include/pango-1.0/pango/pango-layout.h \
 /usr/include/pango-1.0/pango/pango-tabs.h \
 /usr/include/pango-1.0/pango/pango-renderer.h \
 /usr/include/pango-1.0/pango/pango-utils.h \
 /usr/lib/gtk-2.0/include/gdkconfig.h \
 /usr/include/gtk-2.0/gdk/gdkdisplay.h \
 /usr/include/gtk-2.0/gdk/gdkevents.h /usr/include/gtk-2.0/gdk/gdkcolor.h \
 /usr/include/gtk-2.0/gdk/gdkdnd.h /usr/include/gtk-2.0/gdk/gdkinput.h \
 /usr/include/gtk-2.0/gdk/gdkcairo.h /usr/include/gtk-2.0/gdk/gdkpixbuf.h \
 /usr/include/gtk-2.0/gdk/gdkrgb.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-features.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-core.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-transform.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-animation.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-simple-anim.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-io.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-loader.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-enum-types.h \
 /usr/include/pango-1.0/pango/pangocairo.h \
 /usr/include/gtk-2.0/gdk/gdkcursor.h \
 /usr/include/gtk-2.0/gdk/gdkdisplaymanager.h \
 /usr/include/gtk-2.0/gdk/gdkdrawable.h /usr/include/gtk-2.0/gdk/gdkgc.h \
 /usr/include/gtk-2.0/gdk/gdkenumtypes.h \
 /usr/include/gtk-2.0/gdk/gdkfont.h /usr/include/gtk-2.0/gdk/gdkimage.h \
 /usr/include/gtk-2.0/gdk/gdkkeys.h /usr/include/gtk-2.0/gdk/gdkpango.h \
 /usr/include/gtk-2.0/gdk/gdkpixmap.h \
 /usr/include/gtk-2.0/gdk/gdkproperty.h \
 /usr/include/gtk-2.0/gdk/gdkregion.h \
 /usr/include/gtk-2.0/gdk/gdkselection.h \
 /usr/include/gtk-2.0/gdk/gdkspawn.h \
 /usr/include/gtk-2.0/gdk/gdktestutils.h \
 /usr/include/gtk-2.0/gdk/gdkwindow.h \
 /usr/include/gtk-2.0/gdk/gdkvisual.h \
 /usr/include/gtk-2.0/gtk/gtkaccelgroup.h \
 /usr/include/gtk-2.0/gtk/gtkenums.h /usr/include/gtk-2.0/gtk/gtkobject.h \
 /usr/include/gtk-2.0/gtk/gtktypeutils.h \
 /usr/include/gtk-2.0/gtk/gtktypebuiltins.h \
 /usr/include/gtk-2.0/gtk/gtkdebug.h \
 /usr/include/gtk-2.0/gtk/gtkadjustment.h \
 /usr/include/gtk-2.0/gtk/gtkstyle.h \
 /usr/include/gtk-2.0/gtk/gtksettings.h /usr/include/gtk-2.0/gtk/gtkrc.h \
 /usr/include/atk-1.0/atk/atk.h /usr/include/atk-1.0/atk/atkobject.h \
 /usr/include/atk-1.0/atk/atkstate.h \
 /usr/include/atk-1.0/atk/atkrelationtype.h \
 /usr/include/atk-1.0/atk/atkaction.h \
 /usr/include/atk-1.0/atk/atkcomponent.h \
 /usr/include/atk-1.0/atk/atkutil.h \
 /usr/include/atk-1.0/atk/atkdocument.h \
 /usr/include/atk-1.0/atk/atkeditabletext.h \
 /usr/include/atk-1.0/atk/atktext.h \
 /usr/include/atk-1.0/atk/atkgobjectaccessible.h \
 /usr/include/atk-1.0/atk/atkhyperlink.h \
 /usr/include/atk-1.0/atk/atkhyperlinkimpl.h \
 /usr/include/atk-1.0/atk/atkhypertext.h \
 /usr/include/atk-1.0/atk/atkimage.h \
 /usr/include/atk-1.0/atk/atknoopobject.h \
 /usr/include/atk-1.0/atk/atknoopobjectfactory.h \
 /usr/include/atk-1.0/atk/atkobjectfactory.h \
 /usr/include/atk-1.0/atk/atkplug.h \
 /usr/include/atk-1.0/atk/atkregistry.h \
 /usr/include/atk-1.0/atk/atkobjectfactory.h \
 /usr/include/atk-1.0/atk/atkrelation.h \
 /usr/include/atk-1.0/atk/atkrelationset.h \
 /usr/include/atk-1.0/atk/atkselection.h \
 /usr/include/atk-1.0/atk/atksocket.h \
 /usr/include/atk-1.0/atk/atkstateset.h \
 /usr/include/atk-1.0/atk/atkstreamablecontent.h \
 /usr/include/atk-1.0/atk/atktable.h /usr/include/atk-1.0/atk/atkmisc.h \
 /usr/include/atk-1.0/atk/atkvalue.h sysdep.h
vlazyfixed.o: vlazyfixed.c vlazyfixed.h \
 /usr/include/gtk-2.0/gtk/gtkfixed.h \
 /usr/include/gtk-2.0/gtk/gtkcontainer.h \
 /usr/include/gtk-2.0/gtk/gtkwidget.h /usr/include/gtk-2.0/gdk/gdk.h \
 /usr/include/gtk-2.0/gdk/gdkapplaunchcontext.h \
 /usr/include/glib-2.0/gio/gio.h /usr/include/glib-2.0/gio/giotypes.h \
 /usr/include/glib-2.0/gio/gioenums.h /usr/include/glib-2.0/glib-object.h \
 /usr/include/glib-2.0/gobject/gbinding.h /usr/include/glib-2.0/glib.h \
 /usr/include/glib-2.0/glib/galloca.h /usr/include/glib-2.0/glib/gtypes.h \
 /usr/lib/glib-2.0/include/glibconfig.h \
 /usr/include/glib-2.0/glib/gmacros.h /usr/include/glib-2.0/glib/garray.h \
 /usr/include/glib-2.0/glib/gasyncqueue.h \
 /usr/include/glib-2.0/glib/gthread.h /usr/include/glib-2.0/glib/gerror.h \
 /usr/include/glib-2.0/glib/gquark.h /usr/include/glib-2.0/glib/gutils.h \
 /usr/include/glib-2.0/glib/gatomic.h \
 /usr/include/glib-2.0/glib/gbacktrace.h \
 /usr/include/glib-2.0/glib/gbase64.h \
 /usr/include/glib-2.0/glib/gbitlock.h \
 /usr/include/glib-2.0/glib/gbookmarkfile.h \
 /usr/include/glib-2.0/glib/glist.h \
 /usr/include/glib-2.0/glib/gmem.h /usr/include/glib-2.0/glib/gslice.h \
 /usr/include/glib-2.0/glib/gchecksum.h \
 /usr/include/glib-2.0/glib/gconvert.h \
 /usr/include/glib-2.0/glib/gdataset.h /usr/include/glib-2.0/glib/gdate.h \
 /usr/include/glib-2.0/glib/gdatetime.h \
 /usr/include/glib-2.0/glib/gtimezone.h /usr/include/glib-2.0/glib/gdir.h \
 /usr/include/glib-2.0/glib/gfileutils.h \
 /usr/include/glib-2.0/glib/ghash.h /usr/include/glib-2.0/glib/ghook.h \
 /usr/include/glib-2.0/glib/ghostutils.h \
 /usr/include/glib-2.0/glib/giochannel.h \
 /usr/include/glib-2.0/glib/gmain.h /usr/include/glib-2.0/glib/gpoll.h \
 /usr/include/glib-2.0/glib/gslist.h /usr/include/glib-2.0/glib/gstring.h \
 /usr/include/glib-2.0/glib/gunicode.h \
 /usr/include/glib-2.0/glib/gkeyfile.h \
 /usr/include/glib-2.0/glib/gmappedfile.h \
 /usr/include/glib-2.0/glib/gmarkup.h \
 /usr/include/glib-2.0/glib/gmessages.h \
 /usr/include/glib-2.0/glib/gnode.h /usr/include/glib-2.0/glib/goption.h \
 /usr/include/glib-2.0/glib/gpattern.h \
 /usr/include/glib-2.0/glib/gprimes.h /usr/include/glib-2.0/glib/gqsort.h \
 /usr/include/glib-2.0/glib/gqueue.h /usr/include/glib-2.0/glib/grand.h \
 /usr/include/glib-2.0/glib/gregex.h \
 /usr/include/glib-2.0/glib/gscanner.h \
 /usr/include/glib-2.0/glib/gsequence.h \
 /usr/include/glib-2.0/glib/gshell.h /usr/include/glib-2.0/glib/gspawn.h \
 /usr/include/glib-2.0/glib/gstrfuncs.h \
 /usr/include/glib-2.0/glib/gtestutils.h \
 /usr/include/glib-2.0/glib/gthreadpool.h \
 /usr/include/glib-2.0/glib/gtimer.h /usr/include/glib-2.0/glib/gtree.h \
 /usr/include/glib-2.0/glib/gurifuncs.h \
 /usr/include/glib-2.0/glib/gvarianttype.h \
 /usr/include/glib-2.0/glib/gvariant.h \
 /usr/include/glib-2.0/gobject/gobject.h \
 /usr/include/glib-2.0/gobject/gtype.h \
 /usr/include/glib-2.0/gobject/gvalue.h \
 /usr/include/glib-2.0/gobject/gparam.h \
 /usr/include/glib-2.0/gobject/gclosure.h \
 /usr/include/glib-2.0/gobject/gsignal.h \
 /usr/include/glib-2.0/gobject/gmarshal.h \
 /usr/include/glib-2.0/gobject/gboxed.h \
 /usr/include/glib-2.0/gobject/genums.h \
 /usr/include/glib-2.0/gobject/gparamspecs.h \
 /usr/include/glib-2.0/gobject/gsourceclosure.h \
 /usr/include/glib-2.0/gobject/gtypemodule.h \
 /usr/include/glib-2.0/gobject/gtypeplugin.h \
 /usr/include/glib-2.0/gobject/gvaluearray.h \
 /usr/include/glib-2.0/gobject/gvaluetypes.h \
 /usr/include/glib-2.0/gio/gappinfo.h /usr/include/glib-2.0/gio/gaction.h \
 /usr/include/glib-2.0/gio/gsimpleaction.h \
 /usr/include/glib-2.0/gio/gactiongroup.h \
 /usr/include/glib-2.0/gio/gsimpleactiongroup.h \
 /usr/include/glib-2.0/gio/gactiongroup.h \
 /usr/include/glib-2.0/gio/gapplication.h \
 /usr/include/glib-2.0/gio/gapplicationcommandline.h \
 /usr/include/glib-2.0/gio/gasyncinitable.h \
 /usr/include/glib-2.0/gio/ginitable.h \
 /usr/include/glib-2.0/gio/gasyncresult.h \
 /usr/include/glib-2.0/gio/gbufferedinputstream.h \
 /usr/include/glib-2.0/gio/gfilterinputstream.h \
 /usr/include/glib-2.0/gio/ginputstream.h \
 /usr/include/glib-2.0/gio/gbufferedoutputstream.h \
 /usr/include/glib-2.0/gio/gfilteroutputstream.h \
 /usr/include/glib-2.0/gio/goutputstream.h \
 /usr/include/glib-2.0/gio/gcancellable.h \
 /usr/include/glib-2.0/gio/gcharsetconverter.h \
 /usr/include/glib-2.0/gio/gconverter.h \
 /usr/include/glib-2.0/gio/gcontenttype.h \
 /usr/include/glib-2.0/gio/gconverterinputstream.h \
 /usr/include/glib-2.0/gio/gconverteroutputstream.h \
 /usr/include/glib-2.0/gio/gcredentials.h \
 /usr/include/glib-2.0/gio/gdatainputstream.h \
 /usr/include/glib-2.0/gio/gdataoutputstream.h \
 /usr/include/glib-2.0/gio/gdbusaddress.h \
 /usr/include/glib-2.0/gio/gdbusauthobserver.h \
 /usr/include/glib-2.0/gio/gdbusconnection.h \
 /usr/include/glib-2.0/gio/gdbuserror.h \
 /usr/include/glib-2.0/gio/gdbusintrospection.h \
 /usr/include/glib-2.0/gio/gdbusmessage.h \
 /usr/include/glib-2.0/gio/gdbusmethodinvocation.h \
 /usr/include/glib-2.0/gio/gdbusnameowning.h \
 /usr/include/glib-2.0/gio/gdbusnamewatching.h \
 /usr/include/glib-2.0/gio/gdbusproxy.h \
 /usr/include/glib-2.0/gio/gdbusserver.h \
 /usr/include/glib-2.0/gio/gdbusutils.h \
 /usr/include/glib-2.0/gio/gdrive.h \
 /usr/include/glib-2.0/gio/gemblemedicon.h \
 /usr/include/glib-2.0/gio/gicon.h /usr/include/glib-2.0/gio/gemblem.h \
 /usr/include/glib-2.0/gio/gfileattribute.h \
 /usr/include/glib-2.0/gio/gfileenumerator.h \
 /usr/include/glib-2.0/gio/gfile.h /usr/include/glib-2.0/gio/gfileicon.h \
 /usr/include/glib-2.0/gio/gfileinfo.h \
 /usr/include/glib-2.0/gio/gfileinputstream.h \
 /usr/include/glib-2.0/gio/gfileiostream.h \
 /usr/include/glib-2.0/gio/giostream.h \
 /usr/include/glib-2.0/gio/gioerror.h \
 /usr/include/glib-2.0/gio/gfilemonitor.h \
 /usr/include/glib-2.0/gio/gfilenamecompleter.h \
 /usr/include/glib-2.0/gio/gfileoutputstream.h \
 /usr/include/glib-2.0/gio/ginetaddress.h \
 /usr/include/glib-2.0/gio/ginetsocketaddress.h \
 /usr/include/glib-2.0/gio/gsocketaddress.h \
 /usr/include/glib-2.0/gio/gioenumtypes.h \
 /usr/include/glib-2.0/gio/giomodule.h /usr/include/glib-2.0/gmodule.h \
 /usr/include/glib-2.0/gio/gioscheduler.h \
 /usr/include/glib-2.0/gio/gloadableicon.h \
 /usr/include/glib-2.0/gio/gmemoryinputstream.h \
 /usr/include/glib-2.0/gio/gmemoryoutputstream.h \
 /usr/include/glib-2.0/gio/gmount.h \
 /usr/include/glib-2.0/gio/gmountoperation.h \
 /usr/include/glib-2.0/gio/gnativevolumemonitor.h \
 /usr/include/glib-2.0/gio/gvolumemonitor.h \
 /usr/include/glib-2.0/gio/gnetworkaddress.h \
 /usr/include/glib-2.0/gio/gnetworkservice.h \
 /usr/include/glib-2.0/gio/gpermission.h \
 /usr/include/glib-2.0/gio/gpollableinputstream.h \
 /usr/include/glib-2.0/gio/gpollableoutputstream.h \
 /usr/include/glib-2.0/gio/gproxy.h \
 /usr/include/glib-2.0/gio/gproxyaddress.h \
 /usr/include/glib-2.0/gio/gproxyaddressenumerator.h \
 /usr/include/glib-2.0/gio/gsocketaddressenumerator.h \
 /usr/include/glib-2.0/gio/gproxyresolver.h \
 /usr/include/glib-2.0/gio/gresolver.h \
 /usr/include/glib-2.0/gio/gseekable.h \
 /usr/include/glib-2.0/gio/gsettings.h \
 /usr/include/glib-2.0/gio/gsimpleasyncresult.h \
 /usr/include/glib-2.0/gio/gsimplepermission.h \
 /usr/include/glib-2.0/gio/gsocketclient.h \
 /usr/include/glib-2.0/gio/gsocketconnectable.h \
 /usr/include/glib-2.0/gio/gsocketconnection.h \
 /usr/include/glib-2.0/gio/gsocket.h \
 /usr/include/glib-2.0/gio/gsocketcontrolmessage.h \
 /usr/include/glib-2.0/gio/gsocketlistener.h \
 /usr/include/glib-2.0/gio/gsocketservice.h \
 /usr/include/glib-2.0/gio/gsrvtarget.h \
 /usr/include/glib-2.0/gio/gtcpconnection.h \
 /usr/include/glib-2.0/gio/gtcpwrapperconnection.h \
 /usr/include/glib-2.0/gio/gthemedicon.h \
 /usr/include/glib-2.0/gio/gthreadedsocketservice.h \
 /usr/include/glib-2.0/gio/gtlsbackend.h \
 /usr/include/glib-2.0/gio/gtlscertificate.h \
 /usr/include/glib-2.0/gio/gtlsclientconnection.h \
 /usr/include/glib-2.0/gio/gtlsconnection.h \
 /usr/include/glib-2.0/gio/gtlsserverconnection.h \
 /usr/include/glib-2.0/gio/gvfs.h /usr/include/glib-2.0/gio/gvolume.h \
 /usr/include/glib-2.0/gio/gzlibcompressor.h \
 /usr/include/glib-2.0/gio/gzlibdecompressor.h \
 /usr/include/gtk-2.0/gdk/gdkscreen.h /usr/include/cairo/cairo.h \
 /usr/include/cairo/cairo-version.h /usr/include/cairo/cairo-features.h \
 /usr/include/cairo/cairo-deprecated.h \
 /usr/include/gtk-2.0/gdk/gdktypes.h /usr/include/pango-1.0/pango/pango.h \
 /usr/include/pango-1.0/pango/pango-attributes.h \
 /usr/include/pango-1.0/pango/pango-font.h \
 /usr/include/pango-1.0/pango/pango-coverage.h \
 /usr/include/pango-1.0/pango/pango-types.h \
 /usr/include/pango-1.0/pango/pango-gravity.h \
 /usr/include/pango-1.0/pango/pango-matrix.h \
 /usr/include/pango-1.0/pango/pango-script.h \
 /usr/include/pango-1.0/pango/pango-language.h \
 /usr/include/pango-1.0/pango/pango-bidi-type.h \
 /usr/include/pango-1.0/pango/pango-break.h \
 /usr/include/pango-1.0/pango/pango-item.h \
 /usr/include/pango-1.0/pango/pango-context.h \
 /usr/include/pango-1.0/pango/pango-fontmap.h \
 /usr/include/pango-1.0/pango/pango-fontset.h \
 /usr/include/pango-1.0/pango/pango-engine.h \
 /usr/include/pango-1.0/pango/pango-glyph.h \
 /usr/include/pango-1.0/pango/pango-enum-types.h \
 /usr/include/pango-1.0/pango/pango-features.h \
 /usr/include/pango-1.0/pango/pango-glyph-item.h \
 /usr/include/pango-1.0/pango/pango-layout.h \
 /usr/include/pango-1.0/pango/pango-tabs.h \
 /usr/include/pango-1.0/pango/pango-renderer.h \
 /usr/include/pango-1.0/pango/pango-utils.h \
 /usr/lib/gtk-2.0/include/gdkconfig.h \
 /usr/include/gtk-2.0/gdk/gdkdisplay.h \
 /usr/include/gtk-2.0/gdk/gdkevents.h /usr/include/gtk-2.0/gdk/gdkcolor.h \
 /usr/include/gtk-2.0/gdk/gdkdnd.h /usr/include/gtk-2.0/gdk/gdkinput.h \
 /usr/include/gtk-2.0/gdk/gdkcairo.h /usr/include/gtk-2.0/gdk/gdkpixbuf.h \
 /usr/include/gtk-2.0/gdk/gdkrgb.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-features.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-core.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-transform.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-animation.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-simple-anim.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-io.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-loader.h \
 /usr/include/gdk-pixbuf-2.0/gdk-pixbuf/gdk-pixbuf-enum-types.h \
 /usr/include/pango-1.0/pango/pangocairo.h \
 /usr/include/gtk-2.0/gdk/gdkcursor.h \
 /usr/include/gtk-2.0/gdk/gdkdisplaymanager.h \
 /usr/include/gtk-2.0/gdk/gdkdrawable.h /usr/include/gtk-2.0/gdk/gdkgc.h \
 /usr/include/gtk-2.0/gdk/gdkenumtypes.h \
 /usr/include/gtk-2.0/gdk/gdkfont.h /usr/include/gtk-2.0/gdk/gdkimage.h \
 /usr/include/gtk-2.0/gdk/gdkkeys.h /usr/include/gtk-2.0/gdk/gdkpango.h \
 /usr/include/gtk-2.0/gdk/gdkpixmap.h \
 /usr/include/gtk-2.0/gdk/gdkproperty.h \
 /usr/include/gtk-2.0/gdk/gdkregion.h \
 /usr/include/gtk-2.0/gdk/gdkselection.h \
 /usr/include/gtk-2.0/gdk/gdkspawn.h \
 /usr/include/gtk-2.0/gdk/gdktestutils.h \
 /usr/include/gtk-2.0/gdk/gdkwindow.h \
 /usr/include/gtk-2.0/gdk/gdkvisual.h \
 /usr/include/gtk-2.0/gtk/gtkaccelgroup.h \
 /usr/include/gtk-2.0/gtk/gtkenums.h /usr/include/gtk-2.0/gtk/gtkobject.h \
 /usr/include/gtk-2.0/gtk/gtktypeutils.h \
 /usr/include/gtk-2.0/gtk/gtktypebuiltins.h \
 /usr/include/gtk-2.0/gtk/gtkdebug.h \
 /usr/include/gtk-2.0/gtk/gtkadjustment.h \
 /usr/include/gtk-2.0/gtk/gtkstyle.h \
 /usr/include/gtk-2.0/gtk/gtksettings.h /usr/include/gtk-2.0/gtk/gtkrc.h \
 /usr/include/atk-1.0/atk/atk.h /usr/include/atk-1.0/atk/atkobject.h \
 /usr/include/atk-1.0/atk/atkstate.h \
 /usr/include/atk-1.0/atk/atkrelationtype.h \
 /usr/include/atk-1.0/atk/atkaction.h \
 /usr/include/atk-1.0/atk/atkcomponent.h \
 /usr/include/atk-1.0/atk/atkutil.h \
 /usr/include/atk-1.0/atk/atkdocument.h \
 /usr/include/atk-1.0/atk/atkeditabletext.h \
 /usr/include/atk-1.0/atk/atktext.h \
 /usr/include/atk-1.0/atk/atkgobjectaccessible.h \
 /usr/include/atk-1.0/atk/atkhyperlink.h \
 /usr/include/atk-1.0/atk/atkhyperlinkimpl.h \
 /usr/include/atk-1.0/atk/atkhypertext.h \
 /usr/include/atk-1.0/atk/atkimage.h \
 /usr/include/atk-1.0/atk/atknoopobject.h \
 /usr/include/atk-1.0/atk/atknoopobjectfactory.h \
 /usr/include/atk-1.0/atk/atkobjectfactory.h \
 /usr/include/atk-1.0/atk/atkplug.h \
 /usr/include/atk-1.0/atk/atkregistry.h \
 /usr/include/atk-1.0/atk/atkobjectfactory.h \
 /usr/include/atk-1.0/atk/atkrelation.h \
 /usr/include/atk-1.0/atk/atkrelationset.h \
 /usr/include/atk-1.0/atk/atkselection.h \
 /usr/include/atk-1.0/atk/atksocket.h \
 /usr/include/atk-1.0/atk/atkstateset.h \
 /usr/include/atk-1.0/atk/atkstreamablecontent.h \
 /usr/include/atk-1.0/atk/atktable.h /usr/include/atk-1.0/atk/atkmisc.h \
 /usr/include/atk-1.0/atk/atkvalue.h sysdep.h
client.o: client.c sysdep.h client.h game.h tiles.h tiles-enums.h \
 player.h player-enums.h protocol.h cmsg_union.h pmsg_union.h \
 protocol-enums.h game-enums.h
player.o: player.c player.h tiles.h tiles-enums.h player-enums.h sysdep.h \
 player-enums.c
tiles.o: tiles.c tiles.h tiles-enums.h protocol.h player.h player-enums.h \
 cmsg_union.h pmsg_union.h protocol-enums.h sysdep.h tiles-enums.c
fbtiles.o: fbtiles.c
protocol.o: protocol.c protocol.h tiles.h tiles-enums.h player.h \
 player-enums.h cmsg_union.h pmsg_union.h protocol-enums.h sysdep.h \
 enc_cmsg.c dec_cmsg.c enc_pmsg.c dec_pmsg.c cmsg_size.c pmsg_size.c \
 protocol-enums.c
game.o: game.c game.h tiles.h tiles-enums.h player.h player-enums.h \
 protocol.h cmsg_union.h pmsg_union.h protocol-enums.h game-enums.h \
 sysdep.h game-enums.c
sysdep.o: sysdep.c sysdep.h
