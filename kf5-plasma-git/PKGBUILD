# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kf5-plasma-git
pkgver=11167.6b185d2
pkgrel=1
pkgdesc="Plasma library and runtime components"
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('LGPL')
depends=('kf5-kdelibs-git' 'kf5-qca-svn' 'qtquick1-git')
makedepends=('cmake' 'extra-cmake-modules-git' 'git')
conflicts=('kf5-plasma')
provides=('kf5-plasma')
options=('debug')
source=('git://anongit.kde.org/plasma-framework')
md5sums=('SKIP')

pkgver() {
  cd plasma-framework
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  mkdir -p build
}

build() {
  export PKG_CONFIG_PATH=/opt/kf5/lib/pkgconfig:/opt/qt-git/lib/pkgconfig
  export LD_LIBRARY_PATH=/opt/kf5/lib:/opt/qt-git/lib

  cd build
  cmake ../plasma-framework \
    -DCMAKE_PREFIX_PATH=/opt/qt-git/lib/cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DLIB_INSTALL_DIR=lib
  make
}

package() {
  cd build
  make DESTDIR=${pkgdir} install
}
