DESTDIR=
PREFIX=
SRCIX=
PKGNAME=
BIN=$(PREFIX)/usr/bin/$(PKGNAME)
DOC=$(SRCIX)/LICENSE
###################################

fix-all: all

all : group copy
.PHONY : all

group : $(BIN)
	chgrp root $(BIN)
	chmod -s- $(BIN)

copy : $(DOC)
	install -Dm 644 $(DOC) $(DESTDIR)/LICENSE

