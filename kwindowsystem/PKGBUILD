# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwindowsystem
pkgver=4.99.0
pkgrel=1
pkgdesc='KWindowSystem'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kwindowsystem'
license=('LGPL')
depends=('qt5-x11extras' 'libxfixes')
makedepends=('extra-cmake-modules')
groups=('kf5')
source=("http://download.kde.org/unstable/frameworks/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('3c88e023809dc9a6602b8796cbaa3a0c')

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
