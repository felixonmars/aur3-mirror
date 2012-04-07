builddir     = .

top_dir      = /usr/lib/httpd

top_srcdir   = ${top_dir}
top_builddir = ${top_dir}

include ${top_builddir}/build/special.mk

APXS      = apxs
APACHECTL = apachectl
CFLAGS = -I/usr/include/ClearSilver

all: local-shared-build

clean:
	-rm -f *.o *.lo *.slo *.la diary-mkindex
