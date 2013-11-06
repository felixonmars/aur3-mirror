# Maintainer: Yushin Huang <hyslion@gmail.com>

pkgbase=lib32-gcin
pkgname=lib32-gcin
_pkgname=gcin
pkgver=2.8.1
pkgrel=3
true && pkgname=('lib32-gcin-im-client' 'lib32-gcin-qt4' 'lib32-gcin-gtk2')
url='http://hyperrate.com/dir.php?eid=67'
license=('LGPL')
arch=('x86_64')
depends=("gcin=${pkgver}")
makedepends=('lib32-gtk2' 'lib32-qt4' 'gcc-multilib')
source=("http://www.csie.nctu.edu.tw/~cp76/gcin/download/${_pkgname}-${pkgver}.tar.xz"
"qconfig.h"
"lib32-gcin.patch")
sha1sums=('fc7323f1e0558675a94e91de2166c484c72d464d'
'85dba460dc77e0cd07d07a33388a345cc91c98d3'
'ee865f29a5229c652fa63348d7caf00ead7e97e5')

build() {
  cd "${srcdir}/"

  # add 32bit version qconfig.h for 32bit Qt im-module
  mkdir -p QtCore
  cp qconfig.h QtCore/

  # adjust compiler's parameters for 32bit Qt im-module
  export CC="gcc -m32 -I${srcdir} -I${srcdir}/QtCore"
  export CXX="g++ -m32 -I${srcdir} -I${srcdir}/QtCore"

  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -p1 < ${srcdir}/lib32-gcin.patch

  sed '/include suffixes-rule/a \
    CFLAGS+='"${CFLAGS}"' \
    LDFLAGS+='"${LDFLAGS}"' \
    OPTFLAGS=' \
    -i Makefile

  ./configure           \
    --prefix=/usr     \
    --use_i18n=Y

  # due to dependency, gtk-im will be built together
  make -C im-client

  # build Qt4 im-module
  make -C qt4-im
}

package_lib32-gcin-im-client() {
pkgdesc='gcin 32-bit im-client module'
depends=("gcin=${pkgver}")

cd "${srcdir}/${_pkgname}-${pkgver}/im-client"
make DESTDIR="${pkgdir}" install
}

package_lib32-gcin-gtk2() {
pkgdesc='gcin im-module for 32-bit GTK-based applications'
depends=("lib32-gcin-im-client=${pkgver}")
install=lib32-gcin-gtk2.install

cd "${srcdir}/${_pkgname}-${pkgver}/gtk-im"
make DESTDIR="${pkgdir}" install
}

package_lib32-gcin-qt4() {
pkgdesc='gcin im-module for 32-bit Qt4-based applications'
depends=("lib32-gcin-im-client=${pkgver}")

cd "${srcdir}/${_pkgname}-${pkgver}/qt4-im"
make DESTDIR="${pkgdir}" install
}

pkgdesc='gcin im-module for 32-bit applications'
