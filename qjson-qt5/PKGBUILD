# Maintainer: Antonio Rojas
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qjson-qt5
pkgver=r462.c6d92ba
pkgrel=1
pkgdesc="A qt-based library that maps JSON data to QVariant objects"
arch=('i686' 'x86_64')
license=('GPL')
url="http://qjson.sourceforge.net"
depends=('qt5-base')
makedepends=('cmake')
source=("git://github.com/flavio/qjson.git")
md5sums=('SKIP')

pkgver() {
  cd qjson
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../qjson \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
