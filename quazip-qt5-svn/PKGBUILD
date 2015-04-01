# Maintainer: Michael Wendland <michael@michiwend.com>

pkgname=quazip-qt5-svn
pkgver=0.7.1.r257
pkgrel=2
pkgdesc="C++ wrapper for the Gilles Vollant's ZIP/UNZIP C package (Qt5 library)"
url="http://sourceforge.net/projects/quazip/"
arch=('i686' 'x86_64')
depends=('qt5-base')
makedepends=('subversion')
conflicts=('quazip-qt5')
provides=('quazip-qt5')
source=("quazip::svn://svn.code.sf.net/p/quazip/code/trunk")
license=('LGPL')
md5sums=('SKIP')

prepare() {
  rm -rf build
  mkdir build
}

build() {
  cd build
  CXXFLAGS="-fPIC" cmake ../quazip/quazip \
    -DBUILD_WITH_QT4=off \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
