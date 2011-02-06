# Contributor:  Michael Krauss <hippodriver@gmx.net>
# original Contributor: Todd Maynard <arch@toddmaynard.com>

pkgname=ksudoku
pkgver=0.4
pkgrel=4
pkgdesc="Sudoku Puzzle Generator and Solver for KDE"
arch=('i686' 'x86_64')
url="http://ksudoku.sourceforge.net/"
license=('GPL2')
depends=('kdelibs3')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('418f9ecac5756f7bc79863596dee7f34')

build() {
  # apply patch for gcc-4.3 on ksudoku version 0.4
  cp $startdir/gcc43.diff $startdir/src
  cd $startdir/src
  patch -p0 < gcc43.diff  

  cd $startdir/src/$pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX:PATH=`kde-config --prefix`
  make || return 1
  make DESTDIR=$startdir/pkg install
}
