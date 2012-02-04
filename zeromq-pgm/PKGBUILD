# Maintainer: Vladimir Kirillov <proger@wilab.org.ua>

pkgstem=zeromq
pkgname=$pkgstem-pgm
pkgver=2.1.7
pkgrel=1
pkgdesc="Fast messaging system built on sockets, C and C++ bindings.  aka 0MQ, ZMQ. With OpenPGM support."
arch=('i686' 'x86_64')
url="http://www.zeromq.org"
license=('LGPL')
conflicts=('zeromq')
depends=('gcc-libs' 'util-linux-ng' 'libpgm')
makedepends=()
source=(http://download.zeromq.org/$pkgstem-$pkgver.tar.gz)
md5sums=('7d3120f8a8fb913a7e55c57c6eb024f3')

build() {
  cd "$srcdir/$pkgstem-$pkgver"
  ./configure prefix="$pkgdir/usr" --with-pgm
  make
}

package() {
  cd "$srcdir/$pkgstem-$pkgver"
  make install
}

