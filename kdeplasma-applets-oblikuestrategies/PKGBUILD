# Author: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>
# Maintainer: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>

pkgname=kdeplasma-applets-oblikuestrategies
_pkgname=oblikue-strategies
pkgver=1.0
pkgrel=1
pkgdesc="Plasmoid that displays a random draw from Brian Eno and Peter Schmidt's Oblique Strategies"
arch=(any)
url="https://github.com/arcan1s/oblikuestrategies"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(https://github.com/arcan1s/oblikuestrategies/releases/download/V.${pkgver}/${_pkgname}-${pkgver}.tar.xz)
install=${pkgname}.install
md5sums=('062aeed14a56580d90833a6628abfc12')

build ()
{
  if [ -d ${srcdir}/build ]; then
    rm -r ${srcdir}/build
  fi
  mkdir ${srcdir}/build && cd ${srcdir}/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../${_pkgname}/
  make
}

package() 
{
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
