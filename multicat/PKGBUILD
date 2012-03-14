# Maintainer: Sébastien Leblanc ( seb@sebleblanc.net )
pkgname=multicat
pkgver=2.0
pkgrel=3

# 2012-03-14

pkgdesc="A simple and efficient multicast and transport stream manipulation utility, by VideoLAN"
url="http://www.videolan.org/projects/multicat.html"
arch=('x86_64' 'i686')
license=('GPL')

makedepends=('bitstream')

source=("http://downloads.videolan.org/pub/videolan/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
sha512sums=('60b2f8ff2d533888a7cc807a15d2dfc1795567710150993bb8a8ca689b6c28b1eeead9ddba13293b9ab50fae5ebf0ab8c4c6409b3e17675bc6072b121e3e8b53')
       
build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=usr install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
