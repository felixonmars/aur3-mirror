# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=polkit-qt-git
pkgver=r335.c0d8692
pkgrel=1
pkgdesc='A library that allows developers to access PolicyKit API with a nice Qt-style API'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('polkit' 'qt5-base')
makedepends=('extra-cmake-modules' 'git')
conflicts=('polkit-qt5')
provides=('polkit-qt5')
source=('git://anongit.kde.org/polkit-qt-1')
md5sums=('SKIP')

pkgver() {
  cd polkit-qt-1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../polkit-qt-1 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
