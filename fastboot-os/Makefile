# Makefile for fastboot

SRCS+=protocol.c
SRCS+=engine.c
SRCS+=bootimg.c
SRCS+=fastboot.c
SRCS+=usb_linux.c
SRCS+=util_linux.c

VPATH+= ../libzipfile
SRCS+= zipfile.c
SRCS+= centraldir.c

VPATH+= ../libsparse
SRCS+= sparse.c
SRCS+= sparse_read.c
SRCS+= backed_block.c
SRCS+= output_file.c
SRCS+= sparse_err.c
SRCS+= sparse_crc32.c

VPATH+= ../../extras/ext4_utils
SRCS+= make_ext4fs.c
SRCS+= ext4_utils.c
SRCS+= contents.c
SRCS+= allocate.c
SRCS+= wipe.c
SRCS+= uuid.c
SRCS+= extent.c
SRCS+= indirect.c
SRCS+= sha1.c

CPPFLAGS+= -DADB_HOST=1
CPPFLAGS+= -DHAVE_FORKEXEC=1
CPPFLAGS+= -DHAVE_SYMLINKS
CPPFLAGS+= -DHAVE_TERMIO_H
CPPFLAGS+= -D_GNU_SOURCE
CPPFLAGS+= -D_XOPEN_SOURCE
CPPFLAGS+= -I../include
CPPFLAGS+= -I../mkbootimg
CPPFLAGS+= -I../libsparse/include
CPPFLAGS+= -I../../extras/ext4_utils

CFLAGS+= -O2 -Wno-unused-parameter
LDFLAGS= 
LIBS= -lrt -lpthread -lz

OBJS= $(SRCS:.c=.o)

all: fastboot

fastboot: $(OBJS)
	cc -o $@ $(LDFLAGS) $(OBJS) $(LIBS)

install:
	test -d '$(DESTDIR)/usr/bin' || mkdir -p '$(DESTDIR)/usr/bin'
	cp fastboot '$(DESTDIR)/usr/bin'

clean:
	rm -rf $(OBJS)
