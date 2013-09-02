# Author: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>
# Maintainer: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>

pkgname=kdeplasma-applets-oblikuestrategies
_pkgname=oblikue-strategies
pkgver=1.2
pkgrel=2
pkgdesc="Plasmoid that displays a random draw from Brian Eno and Peter Schmidt's Oblique Strategies"
arch=(any)
url="https://github.com/arcan1s/oblikuestrategies"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(https://github.com/arcan1s/oblikuestrategies/releases/download/V.${pkgver}/${_pkgname}-${pkgver}.tar.xz)
install=${pkgname}.install
md5sums=('da4fde42526dff849dc0a5bfd7161d92')

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
