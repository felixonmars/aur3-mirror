# Maintainer: Mike WB2FKO <mph at sportscliche dot com>
pkgname=twpsk
pkgver=3.1
pkgrel=1
pkgdesc="Soundcard based program for PSK31"
arch=('i686')
url="http://wa0eir.home.mchsi.com/twpsk.html"
license=('GPL')
depends=('lesstif')
source=(http://wa0eir.home.mchsi.com/src/$pkgname-$pkgver.1.src.tar.gz)
md5sums=('50496868c0a83816e296806537871f7d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
