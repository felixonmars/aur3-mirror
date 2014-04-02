# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kf5umbrella
pkgver=4.98.0
pkgrel=1
pkgdesc='KF5 Umbrella'
arch=('any')
url='https://projects.kde.org/projects/frameworks/kf5umbrella'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules')
groups=('kf5')
source=("http://download.kde.org/unstable/frameworks/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('a025285094477c30e80855ad65cd2b8c')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
