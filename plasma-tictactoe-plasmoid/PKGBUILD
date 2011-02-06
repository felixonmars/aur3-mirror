# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=plasma-tictactoe-plasmoid
pkgver=1.1
pkgrel=3
pkgdesc="A Tic Tac Toe game for your plasma desktop."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=99329"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('gcc' 'cmake' 'automoc4')
install=tictactoe.install
source=("https://sourceforge.net/projects/tatetiplasmoid/files/TicTacToe%20Plasmoid%20Releases/${pkgver}/TicTacToePlasmoid-${pkgver}.tar.bz2/download")
md5sums=('f1f3fa70df1c70acff0f193310f02bc2')

build() {
  cd $srcdir/TicTacToePlasmoid-$pkgver
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $srcdir/TicTacToePlasmoid-$pkgver/build

  make DESTDIR="$pkgdir/" install
}
# vim:syntax=sh
