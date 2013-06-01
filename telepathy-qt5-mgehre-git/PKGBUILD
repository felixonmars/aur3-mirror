# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=telepathy-qt5-mgehre-git
pkgver=925d1ea
pkgrel=1
pkgdesc="A library for Qt5-based Telepathy clients (mgehre branch)"
arch=('i686' 'x86_64')
url="https://github.com/mgehre/telepathy-qt"
license=('LGPL')
depends=('qt5-base' 'telepathy-farstream')
makedepends=('libxslt' 'python2' 'cmake' 'git' 'doxygen')
conflicts=('telepathy-qt5' 'telepathy-qt5-git')
provides=('telepathy-qt5' 'telepathy-qt5-git')
options=('!libtool')
source=(telepathy-qt-mgehre::git://github.com/mgehre/telepathy-qt.git)
md5sums=('SKIP')

pkgver() {
  cd telepathy-qt-mgehre
  git describe --always | sed 's|-|.|g;s|telepathy.qt.||'
}

prepare() {
  cd telepathy-qt-mgehre

  git checkout debian
}

build() {
  mkdir -p build
  cd build
  cmake ../telepathy-qt-mgehre \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DPYTHON_EXECUTABLE=/usr/bin/python2 \
      -DCMAKE_POSITION_INDEPENDENT_CODE=on \
      -DQT_QMAKE_EXECUTABLE=qmake-qt5 \
      -DENABLE_EXAMPLES=OFF \
      -DENABLE_TESTS=false \
      -DENABLE_EXPERIMENTAL_SERVICE_SUPPORT=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
