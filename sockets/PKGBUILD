# Maintainer: pullmoll <sf at i2pmail dot org>
# Contributor: macieks <macieks at freesco dot pl>
pkgname=sockets
pkgver=2.3.9.9
pkgrel=1
pkgdesc="C++ class library wrapping the berkeley sockets C API"
arch=('i686' 'x86_64')
url="http://www.alhem.net/Sockets/"
license=('GPL')
makedepends=('sed>=4.2' 'libxml2')
depends=('openssl')
source=(http://www.alhem.net/Sockets/Sockets-$pkgver.tar.gz)
md5sums=('ad8cf9a5becffbd626c667456ee13e63')
build() {
  cd $srcdir/Sockets-$pkgver
    make PREFIX=/usr INCLUDE+="-I'/usr/include/libxml2'"
}

package() {
  cd $startdir/src/Sockets-$pkgver
  make PREFIX=$pkgdir/usr install
}
