# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=plzip
pkgver=1.2
pkgrel=1
pkgdesc="A multi-threaded, lossless data compressor based on the LZMA algorithm"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/lzip/plzip.html"
license=('GPL3')
depends=('gcc-libs' 'lzlib')
install=plzip.install
source=(http://download.savannah.gnu.org/releases/lzip/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('0f99aaf0fcb545cd90b254aaf7bc53f32dc75cef1ff3e888ec47f4f97314e531')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
