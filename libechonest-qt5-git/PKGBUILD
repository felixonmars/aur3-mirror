#Maintainer: Michael Wendland <michael@michiwend.com>

pkgname=libechonest-qt5-git
pkgver=2.3.2.6895a77
pkgrel=3
pkgdesc="C++ library for interfacing with Echo Nest (builds the qt5 version)"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/libs/libechonest"
license=('GPL')
makedepends=('git')
depends=('qt5-base')
provides=('libechonest-qt5')
conflicts=('libechonest-qt5')
source=("libechonest::git://github.com/lfranchi/libechonest.git")
md5sums=('SKIP')


prepare() {
  rm -rf build
  mkdir build
}

build() {
  cd build
  cmake ../libechonest -DCMAKE_BUILD_TYPE=Release \
    -DECHONEST_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_WITH_QT4=off
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
