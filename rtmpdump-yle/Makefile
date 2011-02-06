VERSION=v2.3+svn20101104

prefix=/usr/

CC=gcc
LD=ld

CRYPTO=OPENSSL
LIBS=-lz -lssl -lcrypto -ljson librtmp/librtmp.so 
SLIBS=-lpthread $(LIBS)
DEF=-DRTMPDUMP_VERSION=\"$(VERSION)\" $(CRYPTO_DEF) $(XDEF)
OPT=-O2
CFLAGS=-Wall $(XCFLAGS) $(INC) $(DEF) $(OPT)
LDFLAGS=-Wall $(XLDFLAGS)

bindir=$(prefix)/bin
sbindir=$(prefix)/sbin
mandir=$(prefix)/man

BINDIR=$(DESTDIR)$(bindir)
SBINDIR=$(DESTDIR)$(sbindir)
MANDIR=$(DESTDIR)$(mandir)


HEADERS=librtmp/rtmp_sys.h librtmp/rtmp.h librtmp/log.h librtmp/amf.h yle.h

PROGS=rtmpdump-yle rtmpgw rtmpsrv rtmpsuck yle-dl

all:  $(PROGS)

$(PROGS):

install: $(PROGS) 
	-mkdir -p $(BINDIR) $(SBINDIR) $(MANDIR)/man1 $(MANDIR)/man8
	cp rtmpdump-yle yle-dl $(BINDIR)
	chmod a+rx $(BINDIR)/rtmpdump-yle $(BINDIR)/yle-dl
	cp rtmpgw rtmpsrv rtmpsuck $(SBINDIR)
	cp rtmpdump.1 $(MANDIR)/man1
	cp rtmpgw.8 $(MANDIR)/man8
	@cd librtmp; $(MAKE) install

clean:
	rm -f *.o rtmpdump-yle$(EXT) rtmpgw$(EXT) rtmpsrv$(EXT) rtmpsuck$(EXT) yle-dl
	@cd librtmp; $(MAKE) clean


rtmpdump-yle: rtmpdump.o yle.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

rtmpsrv: rtmpsrv.o thread.o
	$(CC) $(LDFLAGS) -o $@ $@.o thread.o $(SLIBS)

rtmpsuck: rtmpsuck.o thread.o
	$(CC) $(LDFLAGS) -o $@ $@.o thread.o $(SLIBS)

rtmpgw: rtmpgw.o thread.o
	$(CC) $(LDFLAGS) -o $@ $@.o thread.o $(SLIBS)

rtmpgw.o: rtmpgw.c $(HEADERS) Makefile
rtmpdump.o: rtmpdump.c $(HEADERS) Makefile
rtmpsrv.o: rtmpsrv.c $(HEADERS) Makefile
rtmpsuck.o: rtmpsuck.c $(HEADERS) Makefile
thread.o: thread.c thread.h
yle.o: yle.c yle.h librtmp/log.h librtmp/amf.h librtmp/http.h librtmp/rtmp.h


yle-dl: yle-dl.py
	sed "s:^.*@BINARY@.*:RTMPDUMPYLE_BINARY = '$(prefix)/bin/rtmpdump-yle':" < yle-dl.py > yle-dl
