#!/bin/sh
# rsr 6/8/03

if [ $# -gt 0 ]; then
  echo "*** aclocal -I $1: acinclude.m4 + configure.ac --> aclocal.m4"
  aclocal -I $1 -I ./aclocal
else
  echo "*** aclocal: acinclude.m4 + configure.ac --> aclocal.m4"
  aclocal -I ./aclocal
fi

echo "*** autoconf: aclocal.m4 + configure.ac --> configure"
autoconf
# ./configure --prefix="/opt"

echo "    config.site + config.cache + config.h.in + Makefile.in + ltmain.sh -->"
echo "    config.cache, config.status, config.h, Makefile, stamp-h, libtool" 

echo "*** libtoolize -f --> ltmain.sh"
libtoolize -f

echo "*** autoheader: acconfig.h + aclocal.m4 + configure.ac --> config.h.in"
autoheader
automake --add-missing --include-deps --foreign
echo "*** automake + libtoolize: configure.ac + makefile.am -->"
echo "    install.sh, missing, mkinstalldirs, Makefile.in, stamp-h.in, "
echo "    config.guess, config.sub, ltmain.sh, ltconfig, COPYING, INSTALL"

echo "*** setting permissions"
chmod 0755 mkinstalldirs

echo "*** please run ./configure next..."


