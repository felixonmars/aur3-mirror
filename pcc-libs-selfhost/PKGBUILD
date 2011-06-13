# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=pcc-libs-selfhost
pkgver=20110613
pkgrel=1
pkgdesc="Self-hosting Portable C Compiler libraries"
arch=('i686' 'x86_64')
url="http://pcc.ludd.ltu.se/"
license=('custom:BSD')
provides=('pcc-libs')
conflicts=('pcc-libs')
depends=('pcc')
makedepends=('cvs')

_cvsroot=":pserver:anonymous@pcc.ludd.ltu.se:/cvsroot"

build() {
#some build environment stuff defined
  export CC=pcc
  export CFLAGS="-xdce -xssa -O -static"

  cd "$srcdir"

  msg "Building libraries"
  msg "Connecting to CVS server...."
  if [ -d pcc-libs/CVS ]; then
    cd pcc-libs
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f pcc-libs
    cd pcc-libs
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/pcc-libs-build"
  cp -ar "$srcdir/pcc-libs" "$srcdir/pcc-libs-build"
  cd "$srcdir/pcc-libs-build"

  ./configure --prefix=/usr || return 1
  make all || return 1
  make DESTDIR=$pkgdir install || return 1
}
