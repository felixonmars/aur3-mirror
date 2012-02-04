# Maintainer: nqn1976 @ gmail.com

pkgname=zanshin-kde
_appname=zanshin
pkgver=0.2beta1
_pkgver=0.1.81
pkgrel=1
pkgdesc="To-do management application for KDE based on Akonadi"
arch=('i686' 'x86_64')
url="http://files.kde.org/zanshin/"
license=('GPL')
depends=('kdebase-runtime' 'kdepim-runtime')
makedepends=('cmake' 'automoc4' 'boost')
source=("http://files.kde.org/zanshin/${_appname}-${_pkgver}.tar.bz2")
md5sums=('272ee8374cec1fd6a778b8f584766c4e')

build() {
  cd ${srcdir}/${_appname}-${_pkgver}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd ${srcdir}/${_appname}-${_pkgver}/build
  make DESTDIR="${pkgdir}" install
}
