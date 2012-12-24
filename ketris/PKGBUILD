# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=ketris
pkgver=1.1.2
pkgrel=1
pkgdesc="A Tetris-like game for KDE."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Ketris?content=148533"
license=('GPL')
depends=('kdebase-runtime' 'kdegames-libkdegames')
makedepends=('cmake' 'automoc4')
install=ketris.install
source=("http://kde-apps.org/CONTENT/content-files/148533-${pkgname}-${pkgver}.tar.gz")
md5sums=('54f5ee8d64491f60b05e17f74fc29d62')

build() {
  cd "${pkgname}-${pkgver}"

  sed -i -e 's/LibKDEGames/KDEGames/' CMakeLists.txt
  mkdir build
  cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
