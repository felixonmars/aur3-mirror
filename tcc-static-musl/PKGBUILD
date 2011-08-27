# Contributor : Jens Staal <staal1978@gmail.com>
# Package copied from: https://aur.archlinux.org/packages.php?ID=16492
pkgname=tcc-static-musl
pkgver=0.9.25
pkgrel=1
pkgdesc="Tiny C Compiler statically compiled against the musl libc"
arch=('i686' 'x86_64')
url="http://bellard.org/tcc/"
license=('LGPL')
source=(http://download.savannah.nongnu.org/releases/tinycc/tcc-${pkgver}.tar.bz2)
options=(docs)
depends=('musl') #musl-git is also good
#optdepends=('tcc') # self-hosting compilation
provides=('tcc')
md5sums=('991c2a1986cce15f03ca6ddc86ea5f43')

build() {
  rm -rf $srcdir/build # start fresh
  cp -ar ${srcdir}/tcc-${pkgver} $srcdir/build
  cd $srcdir/build

 #sed fixes from Gentoo ebuild, cheers!
  # Don't strip
  sed -i -e 's|$(INSTALL) -s|$(INSTALL)|' Makefile

  # Fix examples
  sed -i -e '1{
    i#! /usr/bin/tcc -run
    /^#!/d
  }' examples/ex*.c
  sed -i -e '1s/$/ -lX11/' examples/ex4.c

  msg "Setting up compilation environment"

#  if [ -d /usr/lib/tcc ]; then
#	msg "great! you already got TCC, let's set that as compiler"
#	export CC=tcc #I need to investigate the gcc-musl
#	export CFLags=
#  else
#	msg "poor you, no TCC? do not despair you will soon have it :)"
#	msg "make sure that you got some other compiler installed"
#  fi
#
 
  export CC="musl-gcc"
  export CFLAGS="-Os -static"
  ./configure --prefix=/usr
  make
}

package() {
 cd $srcdir/build
  make tccdir=${pkgdir}/usr/lib/tcc libdir=${pkgdir}/usr/lib \
    mandir=${pkgdir}/usr/share/man bindir=${pkgdir}/usr/bin \
    includedir=${pkgdir}/usr/include \
    docdir=${pkgdir}/usr/share/doc/tcc \
    install

  make clean
  make CFLAGS="-fPIC" libtcc.o || return 1
  ld -shared -soname libtcc.so -o libtcc.so libtcc.o || return 1
  mkdir -p ${pkgdir}/usr/lib/
  install -m755 libtcc.so "${pkgdir}/usr/lib/libtcc.so"
}

