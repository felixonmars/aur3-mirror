# Contributor: Daniel Ehlers <danielehlers@mindeye.net>
pkgname=mpd-lang
pkgver=1.0.1
arch=('i686')
license="Public Domain"
pkgrel=4
pkgdesc="MPD is a new programming language that has a syntax very close to the one used in the book  Foundations of Multithreaded, Parallel, and Distributed Programming."
url="http://www.cs.arizona.edu/mpd/"
depends=('glibc')
build_depends=('yacc')
source=(http://www.cs.arizona.edu/mpd/download/mpd.${pkgver}.tgz)
md5sums=('9a1832555213086a5790987bb1b88029')

build () {
  _MPDCMD=$startdir/pkg/usr/bin
  _MPDLIB=$startdir/pkg/usr/lib/mpd

  cd $startdir/src/mpd.$pkgver
  # Do basic configuration
  ./azconfig
  # Change configuration to our behavour

ed Configuration <<==EOF==
/^MPDCMD *=/s|.*|MPDCMD = /usr/bin|
/^MPDLIB *=/s|.*|MPDLIB = /usr/lib/mpd|
w
q
==EOF==


  make 

  # running test
  mpdv/mpdv -v quick

  # binary
  install -d $_MPDCMD
  cp mpd/mpd         $_MPDCMD;  strip $_MPDCMD/mpd
  cp mpdl/mpdl       $_MPDCMD;  strip $_MPDCMD/mpdl
  cp mpdm/mpdm       $_MPDCMD;  strip $_MPDCMD/mpdm
  cp mpdprof/mpdprof $_MPDCMD;  strip $_MPDCMD/mpdprof


  # libary
  install -d $_MPDLIB
  cp mpd.h           $_MPDLIB
  cp mpdmulti.h      $_MPDLIB
  cp rts/mpdlib.a    $_MPDLIB
  if [ -f /usr/bin/ranlib ]; then ranlib $_MPDLIB/mpdlib.a; fi
  cp library/*.o     $_MPDLIB
  cp library/*.spec  $_MPDLIB
  cp library/*.impl  $_MPDLIB
  cp mpdmap          $_MPDLIB
  cp rts/mpdx        $_MPDLIB;  strip $_MPDLIB/mpdx

  # man pages
  install -d $startdir/pkg/usr/man/man1
  cp man/*.1 $startdir/pkg/usr/man/man1
  install -d $startdir/pkg/usr/man/man3
  cp man/*.3 $startdir/pkg/usr/man/man3
  install -d $startdir/pkg/usr/man/man5
  cp man/*.5 $startdir/pkg/usr/man/man5
}
