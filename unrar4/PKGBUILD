# $Id: PKGBUILD 184245 2013-05-04 21:03:39Z giovanni $
# Current Maintainer: Justin Dray <justin@dray.be>
# Previous Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>
#
# This package only exists due to pyunrar2 being incompatible with
# unrar v5. It will be deprecated after issue 11 against pyunrar2 is
# resolved: https://code.google.com/p/py-unrar2/issues/detail?id=11

pkgbase=unrar
pkgname='unrar4'
pkgver=4.2.4
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.rarlab.com/rar_add.htm"
license=('custom')
pkgdesc="The RAR uncompression program"
makedepends=('gcc-libs')
depends=('gcc-libs')
provides=('unrar')
conflicts=('unrar')
source=("http://www.rarlab.com/rar/unrarsrc-${pkgver}.tar.gz"
        'unrar-4.2.1-soname.patch')
md5sums=('8ea9d1b4139474b282d76e627a2de3e4'
         'b9ec767da9a36f5ac38034c974e77758')

build() {
	cd "${srcdir}/${pkgbase}"

  patch -Np0 -i "${srcdir}/unrar-4.2.1-soname.patch"

  cp -a ${srcdir}/${pkgbase} ${srcdir}/libunrar
  make -C "${srcdir}"/libunrar -f makefile.unix lib libversion=${pkgver} CXXFLAGS="-fPIC ${CXXFLAGS}"
  make -f makefile.unix CXXFLAGS="-fPIC ${CXXFLAGS}" STRIP="true"
}

package() {
  cd "${srcdir}/${pkgbase}"

  install -Dm755 unrar "${pkgdir}/usr/bin/unrar"
  # install license
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
