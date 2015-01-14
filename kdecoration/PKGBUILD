# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kdecoration
pkgver=5.1.95
pkgrel=1
pkgdesc='Plugin based library to create window decorations'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace/'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules')
source=("http://download.kde.org/unstable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('62d1244bf28ba5ed9884fd37def64d82')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
