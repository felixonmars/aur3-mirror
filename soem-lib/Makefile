CC := gcc
RM := rm
LN := ln
LDCONFIG := ldconfig
SRCS := $(wildcard osal/linux/*.c oshw/linux/*.c soem/*.c)
OBJS := $(patsubst %.c,%.o,$(SRCS))
CFLAGS := -ggdb3 -Ioshw/linux -Iosal -Isoem -Wall
LDFLAGS := -lpthread
LIB := libsoem.so
LIBSONAME := $(LIB).1
LIBTARGET := $(LIB).1.0.1
DESTDIR =
PREFIX = /usr/local
LIBDIR = $(PREFIX)/lib
INCDIR = $(PREFIX)/include
HEADERS = $(wildcard osal/*.h oshw/linux/*.h soem/*.h)

all: $(LIBTARGET)

%.o: %.c
	$(CC) $(CFLAGS) -MMD -c -fPIC -o $@ $<
-include $(SRCS:.c=.d)

$(LIBTARGET): $(OBJS)
	$(CC) $(LDFLAGS) -shared -Wl,-soname,$(LIBSONAME) -o $@ $(OBJS)

install: all
	install -dm 755 '$(DESTDIR)$(LIBDIR)/'
	install -m 755 '$(LIBTARGET)' '$(DESTDIR)$(LIBDIR)'
	ldconfig -n '$(DESTDIR)$(LIBDIR)'
	rm -f '$(DESTDIR)$(LIBDIR)/$(LIB)'
	ln -r -s '$(DESTDIR)$(LIBDIR)/$(LIBSONAME)' '$(DESTDIR)$(LIBDIR)/$(LIB)'
	install -dm 755 '$(DESTDIR)$(INCDIR)/soem'
	install -m 644 $(HEADERS) '$(DESTDIR)$(INCDIR)/soem'
	rm -f '$(DESTDIR)$(INCDIR)/soem.h'
	echo '#ifndef _SOEM_H_' >> '$(DESTDIR)$(INCDIR)/soem.h'
	echo '#define _SOEM_H_' >> '$(DESTDIR)$(INCDIR)/soem.h'
	for f in $(HEADERS); do [[ $${f##*/} != ethercatconfiglist.h ]] && echo "#include <soem/$${f##*/}>" >> '$(DESTDIR)$(INCDIR)/soem.h'; done
	echo '#endif' >> '$(DESTDIR)$(INCDIR)/soem.h'

clean:
	$(RM) -f $(OBJS) $(patsubst %.c,%.d,$(SRCS)) $(LIB) $(LIBTARGET)

.PHONY: all clean install
