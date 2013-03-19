# Contributor: Martin Stolpe <martinstolpe {at} gmail ... com>
# Maintainer: Martin Stolpe <martinstolpe {at} gmail ... com>

pkgname=qfsm
pkgver=0.53.0
pkgrel=2
pkgdesc="A Qt graphical tool for designing finite state machines."
arch=('i686' 'x86_64')
url="http://qfsm.sourceforge.net/"
license=('GPL')
depends=('qt4')
makedepends=('cmake' 'graphviz')
install=qfsm.install
source=("http://downloads.sf.net/sourceforge/${pkgname}/${pkgname}-${pkgver}-Source.tar.bz2")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source/build"

  make DESTDIR="${pkgdir}/" install
}
md5sums=('17e25b2cd5f0eae761dfe23014d71751')
