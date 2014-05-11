# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kauth
pkgver=4.99.0
pkgrel=1
pkgdesc='KAuth'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kauth'
license=('LGPL')
depends=('kcoreaddons')
makedepends=('extra-cmake-modules')
groups=('kf5')
source=("http://download.kde.org/unstable/frameworks/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('021779fc1ceab27b8f6f76648bf99654')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF \
    -DKAUTH_BACKEND_NAME=FAKE
#    -DSYSCONF_INSTALL_DIR=/etc
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
