# Maintainer: Antonio Rojas
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=telepathy-qt5
pkgver=0.9.5
pkgrel=1
pkgdesc="A library for Qt5-based Telepathy clients"
arch=('i686' 'x86_64')
url="http://telepathy.freedesktop.org"
license=('LGPL')
depends=('qt5-base' 'telepathy-farstream')
makedepends=('libxslt' 'python2' 'cmake' 'doxygen')
options=('staticlibs')
source=("http://telepathy.freedesktop.org/releases/telepathy-qt/telepathy-qt-$pkgver.tar.gz")
md5sums=('22c0daa7e4f7e48e779f703c9b27b816')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../telepathy-qt-$pkgver \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DPYTHON_EXECUTABLE=/usr/bin/python2 \
      -DQT_QMAKE_EXECUTABLE=qmake-qt5 \
      -DENABLE_EXAMPLES=OFF \
      -DENABLE_TESTS=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
