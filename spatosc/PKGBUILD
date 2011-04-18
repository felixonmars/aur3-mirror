# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=spatosc
pkgver=0.1.6
pkgrel=1
pkgdesc="A C/C++ library that facilitates communication with various 3D audio spatializers."
arch=(i686 x86_64)
url="http://tarballs.quessy.net/"
license=('GPL')
depends=('liblo')
options=('!libtool')
source=($url$pkgname-$pkgver.tar.gz)
md5sums=('0da81d1e91ff3055f41c27300e6e56ac')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
