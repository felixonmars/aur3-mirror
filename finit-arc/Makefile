CC	= gcc
CFLAGS	= -Os -Wall -DVERSION=\"$(VERSION)\" -DWHOAMI=\"`whoami`@`hostname`\"
LD	= gcc
LDFLAGS	=
LIBS	=
VERSION	= 0.2beta
PKG	= finit-$(VERSION)
DFILES	= Makefile README finit.c finit-mod.c finit-arc.c helpers.c helpers.h
BINS	= finit-arc



#### Configurable parameters
# Use -march=pentium-m to build for Eeepc
#CFLAGS += -march=pentium-m

# Use built-in run-parts instead of /bin/run-parts
CFLAGS += -DBUILTIN_RUNPARTS

#### End of configurable parameters

.c.o:
	$(CC) -c $(CFLAGS) -o $*.o $<

all: $(BINS)

finit-arc: finit-arc.o helpers.o
	$(LD) $(LDFLAGS) -o $@ $+ $(LIBS)
	strip $@

finit-arc.o: finit-arc.c Makefile
	$(CC) -c $(CFLAGS) -DDIST_ARCHLINUX -o $@ finit-arc.c

clean:
	rm -f *.o core *~ $(BINS)

helpers.o: helpers.c  Makefile

dist:
	rm -Rf $(PKG)
	mkdir -p $(PKG)/contrib $(PKG)/patches
	for i in $(DFILES); do cp $$i $(PKG)/`dirname $$i`; done
	tar cf - $(PKG) | gzip -c > $(PKG).tar.gz
	rm -Rf $(PKG)
	ls -l $(PKG).tar.gz

