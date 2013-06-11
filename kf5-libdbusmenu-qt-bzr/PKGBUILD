# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kf5-libdbusmenu-qt-bzr
pkgver=245
pkgrel=1
pkgdesc="A library that provides a Qt implementation of the DBusMenu spec"
arch=('i686' 'x86_64')
url="https://launchpad.net/libdbusmenu-qt"
license=('GPL')
depends=('qtbase-git')
makedepends=('cmake' 'bzr' 'doxygen')
conflicts=('kf5-libdbusmenu-qt')
provides=('kf5-libdbusmenu-qt')
options=('debug')
source=(bzr+lp:libdbusmenu-qt)
md5sums=('SKIP')

pkgver() {
  cd libdbusmenu-qt
  bzr revno
}

prepare() {
  mkdir -p build
}

build() {
  export LD_LIBRARY_PATH=/opt/qt-git/lib

  cd build
  cmake ../libdbusmenu-qt \
    -DCMAKE_PREFIX_PATH=/opt/qt-git/lib/cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() { 
  cd build
  make DESTDIR="${pkgdir}" install
}
