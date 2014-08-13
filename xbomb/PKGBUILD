# Contributor: Olivier Duclos <olivier.duclos gmail.com>
# Maintainer: Alexandre Dantas <eu @ alexdantas DOT net>

pkgname=xbomb
pkgver=2.2a
pkgrel=2
pkgdesc="A minesweeper clone with square, hexagonal and triangular grids"
arch=('i686' 'x86_64')
url="http://www.gedanken.org.uk/software/xbomb/"
license=('GPL')
depends=('libxaw')
source=(http://www.gedanken.org.uk/software/xbomb/download/$pkgname-$pkgver.tgz)
md5sums=('9cf384d6428437ec110c02efe94b5022')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's/\/X11R6//' Makefile
  sed -i 's/lib/share\/X11/g' Makefile
  sed -i 's/\/man\//\/share\/man\//g' Makefile
  make CFLAGS=-g
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make INSTDIR=$pkgdir/usr install
}

