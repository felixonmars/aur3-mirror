# Contributor: Antonio Rojas

pkgname=libqtxdg
pkgver=1.0.0
pkgrel=1
pkgdesc="Library providing freedesktop.org specs implementations for Qt"
arch=('i686' 'x86_64')
url='http://lxqt.org/'
license=('LGPL')
depends=('qt5-base')
makedepends=('cmake' 'qt5-tools')
source=("http://lxqt.org/downloads/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('394b6cedec6d580d387a73842343f53e')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DUSE_QT5=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
