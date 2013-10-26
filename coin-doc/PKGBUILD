# Maintainer: mickele <mimocciola@yahoo.com>
pkgname=coin-doc
pkgver=3.1.3
pkgrel=2
pkgdesc="Coin3D HTML documentation."
url="http://www.coin3d.org/"
license="GPL"
arch=('i686' 'x86_64')
depends=()
optdepends=()
makedepends=('make' 'gcc' 'doxygen')
conflicts=()
provides=()
replaces=()
backup=()
install=
options=('docs')
source=("https://bitbucket.org/Coin3D/coin/downloads/Coin-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/Coin-${pkgver}"

  # fix compilation
  sed -i '/^#include "fonts\/freetype.h"$/i #include <cstdlib>\n#include <cmath>' src/fonts/freetype.cpp

  # fix http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=667139
  sed -i '/^#include <Inventor\/C\/basic.h>$/i #include <Inventor/C/errors/debugerror.h>' include/Inventor/SbBasic.h

  cd "${srcdir}"
  mkdir build
  cd build

  ../Coin-${pkgver}/configure --prefix=/usr \
    			    --enable-html
}
package(){
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install || return 1

  rm -rf "${pkgdir}/usr/include" || return 1
  rm -rf "${pkgdir}/usr/bin" || return 1
  rm -rf "${pkgdir}/usr/lib" || return 1
  rm -rf "${pkgdir}/usr/share/aclocal" || return 1
  rm -rf "${pkgdir}/usr/share/man" || return 1
  rm -rf "${pkgdir}/usr/share/Coin" || return 1
}
md5sums=('1538682f8d92cdf03e845c786879fbea')
