# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdnssd-framework
pkgver=4.97.0
pkgrel=1
pkgdesc='KDNSSD Framework'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kdnssd-framework'
license=('LGPL')
depends=('qt5-base' 'avahi')
makedepends=('extra-cmake-modules')
groups=('kf5')
source=("http://download.kde.org/unstable/frameworks/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('2ab96abd80ba7abc53a9deaa45448980')

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
