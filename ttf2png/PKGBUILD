# Maintainer: Thomas Ernstorfer <trofer@gmail.com>
pkgname=ttf2png
pkgver=0.3
pkgrel=1
pkgdesc="Creates a PNG image containing a set of glyphs from a true type font."
arch=('any')
url="http://www.tdb.fi/ttf2png.shtml"
license=('GPL')
depends=('freetype2' 'libpng')
makedepends=('gcc' 'make')
source=("http://www.tdb.fi/files/$pkgname-$pkgver.tar.gz"
        "Makefile.patch")
md5sums=('1611d909f319a27d07ee77b9e88dfebb'
         '912941b14d7c73f1fade773924e5f1d0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i $srcdir/Makefile.patch 
  make prefix='/usr'
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  install $pkgname $pkgdir/usr/bin
}
