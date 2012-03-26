# Maintainer: Cyril Nikolaev <cyril at nichtverstehen dot de>
pkgname=pnglite
pkgver=0.1.17
pkgrel=1
pkgdesc='Lightweight PNG C library.'
arch=('x86_64' 'i686')
url='http://sourceforge.net/projects/pnglite/'
license=('BSD')
depends=('zlib')
makedepends=('patch')
optdepends=()
groups=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/pnglite/pnglite/${pkgver}/${pkgname}-${pkgver}.zip"
	"pnglite.c.patch"
	"LICENSE")
noextract=("pnglite.c.patch")
sha1sums=('0dbfa9965de33bbbe4d79ed4ef9dd83c088fd62b' # pnglite-0.1.17.zip
	'82923a9959e53406520dc107b55c8dae75bc72b1' # pnglite.c.patch
	'edb5ce6193b28bcf03f1b0226ddfad8039827721') # LICENSE

_pkgver_major=0
_soname_base="lib${pkgname}.so"
_soname_a="${_soname_base}.${_pkgver_major}"
_soname_abc="${_soname_base}.${pkgver}"
_prefix="/usr"
 
build() {
  cd "${srcdir}"
  patch -p1 -i ${srcdir}/pnglite.c.patch
  gcc -o ${_soname_base} -shared -fPIC pnglite.c -Wl,-soname,${_soname_a} -lz
}
 
package() {
  install -D "${srcdir}/${_soname_base}" "${pkgdir}${_prefix}/lib/${_soname_abc}"
  install -Dm644 "${srcdir}/pnglite.h" "${pkgdir}${_prefix}/include/pnglite.h"
  ln -s "${_soname_abc}" "${pkgdir}${_prefix}/lib/${_soname_a}"
  ln -s "${_soname_abc}" "${pkgdir}${_prefix}/lib/${_soname_base}"
  install -D "${srcdir}/LICENSE" "${pkgdir}${_prefix}/share/licenses/${pkgname}/LICENSE"
}
