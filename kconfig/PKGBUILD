# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kconfig
pkgver=4.99.0
pkgrel=1
pkgdesc='KConfig'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kconfig'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules')
groups=('kf5')
source=("http://download.kde.org/unstable/frameworks/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('e33647c16fabe50a9545476b6be03eb3')

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
