# Maintainer: Mike WB2FKO <mph at sportscliche dot com>
pkgname=psk31lx
pkgver=2.0
pkgrel=1
pkgdesc="PSK31 using pulseaudio"
arch=('i686')
url="http://wa0eir.home.mchsi.com/psk31lx.html"
license=('GPL')
depends=('libpulse')
source=(http://wa0eir.home.mchsi.com/src/$pkgname-$pkgver.src.tar.gz)
md5sums=('3440d7a141718323f2217b7e1db2aeae')

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
