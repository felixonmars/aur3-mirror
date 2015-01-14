# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libbluedevil-frameworks
pkgver=5.1.95
pkgrel=1
pkgdesc='KDE bluetooth framework libraries'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/libs/libbluedevil'
license=('GPL2')
depends=('qt5-base')
makedepends=('extra-cmake-modules')
conflicts=('libbluedevil')
source=("http://download.kde.org/unstable/plasma/$pkgver/libbluedevil-$pkgver.tar.xz")
md5sums=('c2c7086c106f4815e2949b8ad6f14382')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libbluedevil-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
