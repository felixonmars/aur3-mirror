# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kactivities-frameworks-git
pkgver=r754.66b5131
pkgrel=1
pkgdesc="Core components for the KDE's Activities"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdelibs/kactivities'
license=('LGPL')
depends=('kdeclarative-git' 'kcmutils-git')
provides=('kactivities' 'libkactivities-frameworks' 'kactivities-frameworks')
conflicts=('kactivities')
makedepends=('extra-cmake-modules' 'git' 'boost')
source=('git://anongit.kde.org/kactivities.git')
md5sums=('SKIP')

pkgver() {
  cd kactivities
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kactivities \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DQT_PLUGIN_INSTALL_DIR=lib/qt/plugins \
    -DQML_INSTALL_DIR=lib/qt/qml \
    -DECM_MKSPECS_INSTALL_DIR=/usr/share/qt/mkspecs/modules \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
