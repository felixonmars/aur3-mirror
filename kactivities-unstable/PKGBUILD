# Maintainer: Victor Dodon <dodonvictor at gmail dot com>

pkgname=kactivities-unstable
_pkgname=kactivities
pkgver=4.8.97
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='API for using and interacting with Activities'
url='http://kde.org/'
license=('GPL' 'FDL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
conflicts=('kactivities')
provides=('kactivities')
source=("http://download.kde.org/unstable/${pkgver}/src/${_pkgname}-${pkgver}.tar.xz")
sha1sums=('46ceae20db381c0e4de77f46246ff0db6fdd43a4')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../${_pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $srcdir/build
  make DESTDIR=$pkgdir install
}
