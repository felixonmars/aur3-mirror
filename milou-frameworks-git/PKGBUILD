# Maintainer: Antonio Rojas < nqn1976 @ gmail.com >

pkgname=milou-frameworks-git
pkgver=r330.44bf362
pkgrel=1
pkgdesc="A dedicated search application built on top of Baloo"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/milou/'
license=('LGPL')
provides=('milou-frameworks')
conflicts=('milou-frameworks')
depends=('krunner-git')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
source=('git://anongit.kde.org/milou#branch=frameworks')
md5sums=('SKIP')

pkgver() {
  cd milou
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../milou \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DLIB_INSTALL_DIR=lib \
    -DQML_INSTALL_DIR=lib/qt/qml
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
