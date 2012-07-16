# Maintainer: Bram Schoenmakers <me@bramschoenmakers.nl>

pkgname=kdeplasma-applets-tictactoe
pkgver=1.1
pkgrel=1
pkgdesc="A Tic Tac Toe game for your plasma desktop"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=99329"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasma-tictactoe-plasmoid')
replaces=('plasma-tictactoe-plasmoid')
source=("https://sourceforge.net/projects/tatetiplasmoid/files/TicTacToe%20Plasmoid%20Releases/${pkgver}/TicTacToePlasmoid-${pkgver}.tar.bz2/download")
md5sums=('f1f3fa70df1c70acff0f193310f02bc2')

build() {
  mkdir build
  cd build
  cmake ../TicTacToePlasmoid-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}