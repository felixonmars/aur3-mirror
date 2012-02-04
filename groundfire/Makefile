# Modifié par Nicoco
#
# Copyright (c) 2004, Tom Russell (tom@groundfire.net)
#
# This file is part of the Groundfire project, distributed under the MIT 
# license. See the file 'COPYING', included with this distribution, for a copy
# of the full MIT licence.
#

# This makefile is only tested with the gnu c++ compiler (mingw on Windows)
# To build this with any other compiler you will probably have to alter this
# Makefile (or write your own makefile.)

# note: This makefile will build a Windows executable by default.
#       'make unix' will build groundfire for a unix system (e.g. Linux).

EXENAME      = groundfire

WIN32FLAGS   = -mwindows -mcpu=i686 -O9 -fomit-frame-pointer -ffast-math
WIN32INCLUDE = 
WIN32LIBS    = -lglfw -lopengl32 -lalut -lopenal32

UNIXINCLUDE  = -I/usr/X11R6/include -I/usr/local/include
UNIXLIBS     = -L/usr/X11R6/lib -L/usr/local/lib -lglfw -lGL -lGLU -lalut -lopenal -lX11 -lXxf86vm -lXext -pthread -lm

win32::
	cd src ; $(MAKE) TARGET=$(EXENAME) "FLAGS=$(WIN32FLAGS)" "INCLUDE=$(WIN32INCLUDE)" "LIBS=$(WIN32LIBS)"

unix:
	cd src ; $(MAKE) TARGET=$(EXENAME) "FLAGS=$(CFLAGS)" "INCLUDE=$(UNIXINCLUDE)" "LIBS=$(UNIXLIBS)"

clean:
	rm -f $(EXENAME)*
	cd src ; $(MAKE) clean

depend:
	cd src ; $(MAKE) depend

all:	clean depend
	$(MAKE) win32