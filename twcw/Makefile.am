# Copyright (C) 2005 Ted Williams (wa0eir) <wa0eir@mchsi.com>
#  
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without 
# modifications, as long as this notice is preserved.
# 
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

EXTRA_DIST   = twcw.desktop

SUBDIRS      = src

pixmapdir    = $(datadir)/pixmaps
pixmap_DATA  = src/icons/twcw.png

desktopdir   = $(datadir)/applications
desktop_DATA = twcw.desktop

install-data-local:
	echo Installing Twcw in  $(DESTDIR)@APP_DEFAULTS_PATH@
	$(INSTALL) -d  $(DESTDIR)@APP_DEFAULTS_PATH@
	$(INSTALL_DATA) src/Twcw  $(DESTDIR)@APP_DEFAULTS_PATH@

	echo Installing Help and data files to $(DESTDIR)$(pkgdatadir)
	$(INSTALL) -d twcw  $(DESTDIR)$(pkgdatadir)
	$(INSTALL) -d  $(DESTDIR)$(pkgdatadir)/twcwDir
	$(INSTALL_DATA) src/twcwHelp  $(DESTDIR)$(pkgdatadir)
	$(INSTALL_DATA) src/twcwDir/* $(DESTDIR)$(pkgdatadir)/twcwDir
	$(INSTALL_DATA) THANKS ChangeLog README $(DESTDIR)$(pkgdatadir)


uninstall-local:
	echo Removing Twcw data files
	rm -rf $(DESTDIR)@APP_DEFAULTS_PATH@/Twcw
	rm -rf $(DESTDIR)$(pkgdatadir)

