# Copyright (C) 2006 Glen Ditchfield
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# At the time of writing, the GNU General Public License version 2 was 
# available at <http://www.gnu.org/licenses/gpl.html>.  If it is no longer
# available, you may obtain a copy by writing to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

# Edit these configuration settings to change the location where 
# Excalibur: Morgana's Revenge will be installed.

# The directory under which most files are installed.
PREFIX=$(_PREFIX)/usr

# The directory where user programs are installed.  "emr" goes there.
BINDIR=$(PREFIX)/bin

# The directory where architecture-independant data files are installed.
DATADIR=$(PREFIX)/share
DESKTOPDIR=$(DATADIR)/applications
ICONDIR=$(DATADIR)/pixmaps
SCENARIODIR=$(DATADIR)/alephone/scenarios/emr
DOCDIR=$(DATADIR)/doc
EMRDOCDIR=$(DOCDIR)/emr

# The directory where man pages are installed.
MANDIR=$(PREFIX)/share/man
MAN6DIR=$(MANDIR)/man6

# ----------------
PRODUCTS=emr emr.desktop emr.6

all: $(PRODUCTS)

emr emr.desktop emr.6:
	sed -e s=@PREFIX@=$(PREFIX)=g \
	    -e s=@BINDIR@=$(BINDIR)=g \
	    -e s=@ALEPHONE@=$(ALEPHONE)=g \
	    -e s=@DATADIR@=$(DATADIR)=g < $@.in > $@

install: all installdirs
	install -m755 emr $(BINDIR)
	install -m644 emr.6 $(MAN6DIR)
	cp -r share-emr/* $(SCENARIODIR)
	cp -r share-doc-emr/* $(EMRDOCDIR)
	install -m644 emr.desktop $(DESKTOPDIR)
	install -m644 emr.png $(ICONDIR)

installdirs:
	[ -d $(BINDIR) ] || mkdir -p $(BINDIR)
	[ -d $(MANDIR) ] || mkdir -p $(MANDIR)
	[ -d $(MAN6DIR) ] || mkdir -p $(MAN6DIR)
	[ -d $(DATADIR) ] || mkdir -p $(DATADIR)
	[ -d $(DESKTOPDIR) ] || mkdir -p $(DESKTOPDIR)
	[ -d $(ICONDIR) ] || mkdir -p $(ICONDIR)
	[ -d $(SCENARIODIR) ] || mkdir -p $(SCENARIODIR)
	[ -d $(DOCDIR) ] || mkdir -p $(DOCDIR)
	[ -d $(EMRDOCDIR) ] || mkdir -p $(EMRDOCDIR)

uninstall:
	rm $(BINDIR)/emr
	rm $(MAN6DIR)/emr.6
	rm -rf $(SCENARIODIR)
	rm -rf $(EMRDOCDIR)
	rm $(DESKTOPDIR)/emr.desktop
	rm $(ICONDIR)/emr.png

clean:
	rm -f $(PRODUCTS)
