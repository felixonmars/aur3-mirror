# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=kf5-soprano-qt5-git
pkgver=v2.9.3.r90.g3e00d37
pkgrel=1
arch=('i686' 'x86_64')
url='http://soprano.sourceforge.net/'
license=('GPL' 'LGPL')
pkgdesc='A library which provides a highly usable object-oriented C++/Qt5 framework for RDF data'
depends=('qt5-base' 'libiodbc' 'virtuoso-base' 'redland')
makedepends=('cmake' 'java-environment' 'doxygen' 'qt5-base' 'libiodbc'
             'virtuoso-base' 'redland' 'git')
conflicts=('kf5-soprano-qt5')
provides=('kf5-soprano-qt5')
source=("git://anongit.kde.org/soprano.git")
md5sums=('SKIP')

pkgver() {
  cd soprano
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  mkdir build
}

build() {
  cd build
  # we need the rpath
  cmake ../soprano \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=OFF \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5 \
    -DSOPRANO_DISABLE_CLUCENE_INDEX=ON \
    -DQT5_BUILD=TRUE
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
