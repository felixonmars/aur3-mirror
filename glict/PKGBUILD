# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=glict
pkgver=1.1
pkgrel=4
pkgdesc="Graphics Library Interface Creation Toolkit (GLICT)."
arch=('i686' 'x86_64')
url="http://glict.sourceforge.net/"
license=('GPL')
depends=('mesa')
makedepends=('gcc' 'make')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('f62493d305feffe8cc5d7011c05c9763')

build() { 
  cd ${srcdir}/${pkgname}-${pkgver}/GLICT

  # gcc 4.4 fix, too lazy for patch...
  sed -i -e '/<string.h>/ a\#include <stdio.h>' fonts.cpp || return 1
  sed -i -e '/globals.h>/ a\#include <stdio.h>' list.cpp || return 1
  sed -i -e '/types.h>/ a\#include <stdio.h>' progressbar.cpp || return 1

  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/GLICT
  install -d ${pkgdir}/usr/{lib,include/GLICT} || return 1

  install -m644 *.a ${pkgdir}/usr/lib/ || return 1
  install -m644 *.h ${pkgdir}/usr/include/GLICT/ || return 1
}
