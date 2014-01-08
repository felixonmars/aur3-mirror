# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kf5-attica
pkgver=4.95.0
pkgrel=1
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kdesupport/attica'
pkgdesc='A Qt5 library that implements the Open Collaboration Services API'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules')
source=("http://download.kde.org/unstable/frameworks/${pkgver}/attica-${pkgver}.tar.xz")
md5sums=('f976519a7ea23abf6ca0296e169f3156')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../attica-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DATTICA_ENABLE_TESTS=OFF \
    -DQT4_BUILD=OFF \
    -DLIB_DESTINATION=/opt/kf5/lib
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
