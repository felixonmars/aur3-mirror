# Contributor: Henri Häkkinen <henuxd@gmail.com>

pkgname=libscgi
pkgver=0.8
pkgrel=2
pkgdesc="Library offering a useful API for SCGI client programs written in C."
arch=('i686' 'x86_64')
url="http://labs.asn.pl/asnlibs/wiki/libscgi"
license=('GPL')
provides=('libscgi')
depends=('libasn')
source=(http://download.asn.pl/asnlibs/$pkgname-$pkgver.tar.gz)
md5sums=('937ee460c5d379eda5987f2a1c1d4055')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
