# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=libqinfinity-git
pkgver=212.5323863
pkgrel=1
pkgdesc='Qt wrapper around libinfinity, a library for collaborative editing'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/libs/libqinfinity'
license=('LGPL')
depends=('libinfinity')
makedepends=('cmake' 'git')
provides=('libqinfinity')
conflicts=('libqinfinity')
source=('git://anongit.kde.org/libqinfinity')
md5sums=('SKIP')

pkgver() {
  cd libqinfinity
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libqinfinity \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
