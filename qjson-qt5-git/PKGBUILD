# Maintainer: Michael Wendland <michael@michiwend.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas

pkgname=qjson-qt5-git
pkgver=0.8.2.d0f62e6
pkgrel=2
pkgdesc="A qt-based library that maps JSON data to QVariant objects (builds the qt5 version)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://qjson.sourceforge.net"
depends=('qt5-base')
provides=('qjson-qt5')
conflicts=('qjson-qt5')
makedepends=('cmake')
source=("qjson::git://github.com/flavio/qjson.git")
md5sums=('SKIP')


prepare() {
  rm -rf build
  mkdir build
}

build() {
  cd build
  cmake ../qjson \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
