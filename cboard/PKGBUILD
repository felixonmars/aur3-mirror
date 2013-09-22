# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=cboard
pkgver=0.7.1
pkgrel=1
pkgdesc="An NCurses PGN browser, editor, and front end to chess engines that use the XBoard protocol" 
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/c-board/"
license=('GPL2')
depends=('ncurses')
source=(http://downloads.sourceforge.net/project/c-board/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('e1763a55c9c36e7b7209d05a25df89c8')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --without-ncursesw
  sed -i 's|O_CREAT|O_CREAT, 0666|' libchess/pgn.c 
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
