# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=ki18n
pkgver=4.99.0
pkgrel=1
pkgdesc='Ki18n'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/ki18n'
license=('LGPL')
depends=('qt5-script' 'kjs')
makedepends=('extra-cmake-modules')
groups=('kf5')
source=("http://download.kde.org/unstable/frameworks/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('aec50a8bce055c81e361088df61a4a7c')

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
