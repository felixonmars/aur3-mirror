CC=gcc
CFLAGS=-c
BFLAGS=-o # BUILD/LINK FLAGS
SRC=stardate.c
BIN=stardate

# PKG INFO
PKGNAME=

# DOCUMENTATION
README=README
LICENSE=COPYRIGHT
MANPAGE=stardate.1

# INSTALL DIRS
PREFIX=/usr
DATADIR=$(PREFIX)/share
MANDIR=$(DATADIR)/man/man1
COPYDIR=$(DATADIR)/licenses/$(PKGNAME)
DOCDIR=$(DATADIR)/doc/$(PKGNAME)
BINDIR=$(PREFIX)/bin
########################################3

all: $(BIN)

$(BIN): $(BIN).o
	$(CC) $(BIN).o $(BFLAGS) $(BIN)

$(BIN).o: $(SRC)
	$(CC) $(CFLAGS) $(SRC)

clean:
	rm -rf *o stardate

install: 
	install -m 644 -D $(README)  $(DESTDIR)$(DOCDIR)/$(README)
	install -m 644 -D $(MANPAGE) $(DESTDIR)$(MANDIR)/$(MANPAGE)
	install -m 755 -D $(BIN)     $(DESTDIR)$(BINDIR)/$(BIN)
	install -m 644 -D $(LICENSE) $(DESTDIR)$(COPYDIR)/$(LICENSE)
