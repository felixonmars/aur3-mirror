# Contributer: Richard Jackson <rj@iinet.net.au>
# Maintainer: Chirantan Mitra <chirantan dot mitra at gmail dot com>

pkgname="bacon"
pkgver="3.0.2"
pkgrel="1"
pkgdesc="BaCon is a free BASIC to C translator for Unix-based systems"
arch=("i686" "x86_64")
url="http://www.basic-converter.org/"
license=("GPL3")
depends=("bash")
optdepend=("gtksourceview2: For bacongui")
options=("staticlibs")
source=("http://www.basic-converter.org/stable/$pkgname-$pkgver.tar.gz")
sha512sums=("a0dd89dabb40d3fdaad84d058a14d7bb7d4f8eecfb24e3996ffb477abd5423dc6c71d63fca54f086a636ef11b0c9eb52d227c9e33326d031e00971108b91900e")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --with-bash
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make BINDIR="$pkgdir/usr/bin/" LIBDIR="$pkgdir/usr/lib" MANDIR="$pkgdir/usr/share/man" DATADIR="$pkgdir/usr/share" install
}
