# Makefile "stolen" from pidgin-qip: http://fialky.com/drupal-5.0/?q=node/13

OS=linux
CC=gcc

#
# Linux Build Specifics:
#
ifeq ($(OS), linux)
#TARGET=pidgin-qip.so
TARGET=qip-decoder.so
CFLAGS+=`pkg-config pidgin --cflags` -fPIC
LDFLAGS+=`pkg-config pidgin --libs` -shared
PREFIX?=/usr/
PIDGIN_PLUGIN_PATH ?= $(PREFIX)/lib/pidgin/
endif


#
# Windows Build Specifics
#
ifeq ($(OS), win32)
#TARGET = pidgin-qip.dll
TARGET = qip-decoder.dll

# Windows users, please check out this :

# Please install the pidgin gtk package (check the readme)
GTK=C:/cygwin/work/win32-dev/gtk_2_0
# Please download pidgin corresponding sources, we need them
PIDGINSRC=C:/cygwin/work/pidgin-2.3.1
# You need to have pidgin installed, please tell us where
PIDGIN=C:/Program\ Files/Pidgin
# Pidgin plugins default directory, it should be OK
PIDGIN_PLUGIN_PATH=$(PIDGIN)/plugins

# Nothing to modify after this point:
# Include dirs
CFLAGS+=-I$(GTK)/include
CFLAGS+=-I$(GTK)/include/glib-2.0
CFLAGS+=-I$(GTK)/include/atk-1.0
CFLAGS+=-I$(GTK)/include/gtk-2.0
CFLAGS+=-I$(GTK)/include/pango-1.0
CFLAGS+=-I$(GTK)/lib/gtk-2.0/include
CFLAGS+=-I$(GTK)/lib/glib-2.0/include
CFLAGS+=-I$(PIDGINSRC)/pidgin
CFLAGS+=-I$(PIDGINSRC)/pidgin/win32
CFLAGS+=-I$(PIDGINSRC)/libpurple

LDFLAGS=-shared -L$(GTK)/lib -L$(PIDGIN)
LDFLAGS+=-latk-1.0 -lgtk-win32-2.0.dll
LDFLAGS+=-lpidgin -lpurple -lintl -lgmodule-2.0.dll
LDFLAGS+=-lglib-2.0.dll -lgdk-win32-2.0.dll
LDFLAGS+=-lgdk_pixbuf-2.0.dll
LDFLAGS+=-lgobject-2.0.dll
LDFLAGS+=-lpango-1.0.dll
LDFLAGS+=-lpangowin32-1.0.dll
CC=gcc
INSTALL=cp
RM=erase
endif

# Debug selection, use 'make NODEBUG=1'
NODEBUG=0
ifeq ($(NODEBUG), 0 )
CFLAGS+=-g
endif

RM?=rm
INSTALL?=install -D

# Objects rules ...

#OBJS=pidgin-qip.o
OBJS=qip-decoder.o
#OBJS+=urlhandler.o
#OBJS+=plugin.o
#OBJS+=ui.o

CFLAGS+=-Wall -Werror

$(TARGET): $(OBJS)
	$(CC) -o $(TARGET) $(OBJS) $(LDFLAGS) $(CFLAGS)

#pidgin-qip.o: pidgin-qip.c pidgin-qip.h
#urlhandler.o: urlhandler.c pidgin-qip.h
#plugin.o: plugin.c pidgin-qip.h
#ui.o: ui.c pidgin-qip.h
pidgin-qip.o: pidgin-qip.c
qip-decoder.o: qip-decoder.c

.PHONY: clean
clean:
	$(RM) $(TARGET) $(OBJS)

.PHONY: install 
install: $(TARGET)
	$(INSTALL)  $(TARGET) $(PIDGIN_PLUGIN_PATH)/
