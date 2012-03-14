# Maintainer: Sébastien Leblanc ( seb@sebleblanc.net )

pkgname=bitstream
pkgver=1.0
pkgrel=3

pkgdesc="A set of C headers allowing a simpler access to binary structures such as specified by MPEG, DVB, IETF, etc., by VideoLAN"
url="http://www.videolan.org/developers/bitstream.html"
arch=('any')
license=('MIT')

source=("http://download.videolan.org/pub/videolan/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
sha512sums=('046bce0a6e2bfcd21a180eed9c4b7b577292a0a45797408c98973e4156438b6376c09bf7a4546f8f052f0ff640ab71dfdc9a5f7da2bd4affb87b87774f038491')

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make PREFIX=usr DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
