SHELL = /bin/bash
INSTALL = /usr//bin/install -c
MSGFMT = /usr/bin/msgfmt
SED = /bin/sed
DESTDIR =
bindir = /usr/bin
localedir = /usr/share/locale
config = /usr/share/lyrarch
icons = /usr/share/pixmaps
deskdir = /usr/share/applications

all:

install: all
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL) -d $(DESTDIR)$(config)
	$(INSTALL) -d $(DESTDIR)$(icons)
	$(INSTALL) -d $(DESTDIR)$(deskdir)
	$(INSTALL) -m755 lyrarch $(DESTDIR)$(bindir)
	$(INSTALL) -m755 lyrlogo $(DESTDIR)$(config)
	$(INSTALL) -m644 LOG $(DESTDIR)$(config)
	$(INSTALL) -m644 COPYING $(DESTDIR)$(config)
	$(INSTALL) -m644 AUTHORS $(DESTDIR)$(config)
	$(INSTALL) -m644 lyrarch.png $(DESTDIR)$(icons)
	$(INSTALL) -m644 lyrarch.desktop $(DESTDIR)$(deskdir)
