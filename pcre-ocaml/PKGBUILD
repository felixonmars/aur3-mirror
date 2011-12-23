# Maintainer: <oliver@first.in-berlin.de>

pkgname=pcre-ocaml
pkgver=6.2.4
pkgrel=1
pkgdesc="OCaml PCRE-binding"
arch=('x86_64')
license=('LGPL')
depends=('pcre')
source=(http://hg.ocaml.info/release/pcre-ocaml/archive/release-6.2.4.tar.gz)
md5sums=('649fd1c1abacd7efe27c8f446d554a84')
url="http://www.ocaml.info/home/ocaml_sources.html#pcre-ocaml"


build() {
cd ${srcdir}/${pkgname}-release-${pkgver}/lib

make byte-code-library native-code-library

}


package() {
cd ${srcdir}/${pkgname}-release-${pkgver}

cd lib

OCAML_LIB_INSTALL=${pkgdir}/usr/lib/ocaml/pcre/ make rawinstall

cp META ${pkgdir}/usr/lib/ocaml/pcre/


}
