# $Id: PKGBUILD 178965 2013-03-01 10:21:35Z andrea $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=libdbusmenu-qt5
pkgver=0.9.3+14.04.20140314
pkgrel=1
pkgdesc="A library that provides a Qt implementation of the DBusMenu spec"
arch=('i686' 'x86_64')
url="https://launchpad.net/libdbusmenu-qt"
license=('GPL')
depends=('qt5-base')
makedepends=('cmake')
source=("http://archive.ubuntu.com/ubuntu/pool/main/libd/libdbusmenu-qt/libdbusmenu-qt_${pkgver}.orig.tar.gz")
md5sums=('0e8df8b3e082afb4ecbb7b0279cb0b98')
options=(strip debug)

build() {
  cd libdbusmenu-qt-${pkgver}
  mkdir -p build
  cd build
  CXXFLAGS+=' -std=c++11'
  export CXXFLAGS
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_QT5=On \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_DOC=Off
  make
}

package() {
  cd libdbusmenu-qt-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
