# $Id$
# Maintainer: Luca Fulchir <luca@fulchir.it>

pkgname=libeio-cvs
pkgver=20130830
pkgrel=1
makedepends=('cvs')
pkgdesc="Event-based fully asynchronous I/O library for C"
arch=('i686' 'x86_64')
url="http://software.schmorp.de/pkg/libeio.html"
license=('BSD')

_cvsroot=":pserver:anonymous@cvs.schmorp.de/schmorpforge"
_cvsmod="libeio"

pkgver() {
	date +%Y%m%d
}

build() {

  cd ${srcdir}

  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod-
  fi
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_cvsmod}"

  make DESTDIR="${pkgdir}" install

}

