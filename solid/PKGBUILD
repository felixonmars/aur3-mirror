# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=solid
pkgver=4.99.0
pkgrel=1
pkgdesc='Solid'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/solid'
license=('LGPL')
depends=('qt5-declarative' 'media-player-info' 'upower' 'udisks2')
makedepends=('extra-cmake-modules')
groups=('kf5')
source=("http://download.kde.org/unstable/frameworks/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('56c94301ad9675d5aec896041501dfcc')

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
    -DHUPNP_ENABLED=FALSE
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
