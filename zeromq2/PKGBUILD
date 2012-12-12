# $Id$
pkgname=zeromq2
_pkgname=zeromq
pkgver=2.2.0
pkgrel=2
pkgdesc="Fast messaging system built on sockets, C and C++ bindings.  aka 0MQ, ZMQ."
arch=('i686' 'x86_64')
url="http://www.zeromq.org"
license=('LGPL')
depends=('gcc-libs' 'util-linux')
makedepends=('python2')
conflicts=('zeromq')
source=(http://download.zeromq.org/${_pkgname}-$pkgver.tar.gz)
md5sums=('1b11aae09b19d18276d0717b2ea288f6')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  ./configure prefix=/usr --with-pgm
  sed -i 's/python$/&2/' foreign/openpgm/build-staging/openpgm/pgm/{Makefile,version_generator.py}
  make
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install
}


