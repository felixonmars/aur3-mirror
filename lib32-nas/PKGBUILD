# Maintainer: none
# Contributer: Kevin Cox <kevincox@kevincox.ca>
# Contributer: Gadget3000 <gadget3000 at msn dot com>
pkgname=lib32-nas
_pkgname=nas
pkgver=1.9.4
pkgrel=1
pkgdesc='Network Audio System is a network transparent, client/server audio transport system'
arch=('x86_64')
url='http://radscan.com/nas.html'
license=('MIT')
depends=('lib32-libxt')
makedepends=('imake' 'gcc-multilib' 'lib32-libxaw')
source=("http://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}-${pkgver}.src.tar.gz"
"license")
md5sums=('dac0e6cd3e5d6a37ae1dff364236a752'
         'f11eb8c3fb83946e66e60f7532e8d5da')

_args=(
'CC=gcc -m32' 'CXX=g++ -m32' 'LD=gcc -m32'
'PKG_CONFIG_PATH=/usr/lib32/pkgconfig'
'USRLIBDIR=/usr/lib32'
)

build() {
   cd ${_pkgname}-${pkgver}

   xmkmf

   make World "${_args[@]}"
}

package() {
   cd ${_pkgname}-${pkgver}

   make "DESTDIR=${pkgdir}" "${_args[@]}" install

   chmod 644 ${pkgdir}/usr/include/audio/*

   install -D -m644 ${srcdir}/license ${pkgdir}/usr/share/licenses/${_pkgname}/license
}
