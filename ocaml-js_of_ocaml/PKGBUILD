# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='js_of_ocaml'
pkgname="ocaml-${srcname}"
pkgver='1.3.2'
pkgrel=1
pkgdesc='A compiler of OCaml bytecode to Javascript'
arch=('i686' 'x86_64')
url='http://ocsigen.org/'
license=('LGPL')
depends=('ocaml' 'ocaml-lwt' 'ocaml-deriving-git')
makedepends=('ocaml-findlib')
options=('!strip')
source=("http://ocsigen.org/download/${srcname}-${pkgver}.tar.gz"
        'Makefile.patch')
md5sums=('d6998737d30a97830d030433c5818258'
         '95866df5f78499361539c4cafb6f60e6')

build() {
  cd "${srcdir}/${srcname}-${pkgver}"
  patch -p0 < "${startdir}/Makefile.patch"

  env DESTDIR="$pkgdir" \
    OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)" \
    make BINDIR="${pkgdir}/usr/bin"
}


package() {
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

  cd "$srcdir/${srcname}-${pkgver}"
  env DESTDIR="$pkgdir" \
    OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)" \
    make BINDIR="${pkgdir}/usr/bin" install
}
