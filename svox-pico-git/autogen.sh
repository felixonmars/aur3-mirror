#!/bin/sh

#created by aclocal
rm -rf autom4te.cache
rm -f aclocal.m4

#created by libtoolize
rm -rf m4
rm -f ltmain.sh

#created by autoconf
rm -f configure

#created by automake
rm -f install-sh missing depcomp Makefile.in config.guess config.sub

#created by ./configure
rm -rf .deps
rm -f Makefile config.log config.status libtool

if [ "$1" = "clean" ]; then
    exit
fi

mkdir m4
touch NEWS README AUTHORS ChangeLog

IPATHS="-I lib"

aclocal $IPATHS
libtoolize
autoconf $IPATHS
automake --add-missing

rm -rf autom4te.cache
