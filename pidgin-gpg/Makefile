# pidgin-gpg Makefile
#
# Copyright (C) 2007 Andrey Angelov <mortallink@mail.ru>
#
# Modified for ArchLinux i686 by Tilman Bartsch <tba@timaba.de>
# -use make instead of gmake
# -set correct path (DESTDIR)/usr/lib/pidgin
#
#
#Note for Linux compilation use make for BSD use gmake
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation; either version 2.1 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program; if not, write to the Free Software 
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

CC := gcc
LIBTOOL := libtool

#ifeq ($(PREFIX),)
#  LIB_INSTALL_DIR = $(PREFIX)/lib/pidgin
#else
#  LIB_INSTALL_DIR = $(HOME)/.purple/plugins
#endif

PIDGIN_GPG = pidgin-gpg

#cflags need for compilation
PIDGIN_CFLAGS = $(shell pkg-config pidgin --cflags)
GTK_CFLAGS = $(shell pkg-config gtk+-2.0 --cflags)
GPGME_CFLAGS = $(shell gpgme-config --cflags)

#libflags need for compilation
PIDGIN_LIBS = $(shell pkg-config pidgin --libs)
GTK_LIBS = $(shell pkg-config gtk+-2.0 --libs)
GPGME_LIBS = $(shell gpgme-config --libs)

#pidgin libs directory
PIDGIN_LIBDIR  = $(shell pkg-config --variable=libdir pidgin)/pidgin

all: 
	@make compilation

#compilation
compilation:
	@echo
	@echo "Compiling now..."
	@echo
	@make $(PIDGIN_GPG).so
	
#making	
$(PIDGIN_GPG).so: $(PIDGIN_GPG).o
	$(CC) -D_FILE_OFFSET_BITS=64 -shared $(CFLAGS) $< -o $@ $(PIDGIN_LIBS) $(GTK_LIBS) $(GPGME_LIBS) -Wl,--export-dynamic -Wl,-soname
	
	@echo 
	@ls -l pidgin-gpg.so
	@echo
	@echo -e "Compiling finished -->> $(PWD)/\033[1mpidgin-gpg.so\033[0m"
	@echo
	
$(PIDGIN_GPG).o:$(PIDGIN_GPG).c $(PIDGIN_GPG).h
	$(CC) $(CFLAGS) -D_FILE_OFFSET_BITS=64 -O2 -fPIC -c $< -o $@ $(PIDGIN_CFLAGS) $(GPGME_CFLAGS) $(GTK_CFLAGS) -DHAVE_CONFIG_H

#do install
install: all
	@echo
	@echo "Installing now..."
	@echo
	mkdir -p $(DESTDIR)/usr/lib/pidgin/
	cp $(PIDGIN_GPG).so $(DESTDIR)/usr/lib/pidgin/

#do clean
clean:
	@echo
	@echo Cleaning up...
	rm -rf *.o *.c~ *.h~ *.so *.la .libs
