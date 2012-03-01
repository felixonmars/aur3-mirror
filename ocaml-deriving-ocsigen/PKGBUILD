# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='deriving-ocsigen'
pkgname="ocaml-${srcname}"
pkgver='0.3c'
pkgrel=1
pkgdesc='Extension to OCaml for deriving functions from type declarations'
arch=('i686' 'x86_64')
url='https://github.com/hnrgrgr/deriving'
license=('MIT')
depends=('ocaml' 'ocaml-type-conv')
makedepends=('ocaml-findlib')
options=('!strip')
source=("http://ocsigen.org/download/${srcname}-${pkgver}.tar.gz")
md5sums=('fec1ca031fc988034e2b681d62da60e8')

build() {
  cd "$srcdir/${srcname}-${pkgver}"
  env DESTDIR="$pkgdir" \
    OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)" \
    make
}


package() {
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

  cd "$srcdir/${srcname}-${pkgver}"
  env DESTDIR="$pkgdir" \
    OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)" \
    make install
}
