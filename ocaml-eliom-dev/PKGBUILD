# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='eliom'
pkgname="ocaml-${srcname}-dev"
pkgver=2.0_rc2
pkgrel=1
pkgdesc='An extensible Web server written in OCaml'
arch=('i686' 'x86_64')
url='http://ocsigen.org/'
license=('LGPL')
depends=('ocaml' 'ocaml-ocsigenserver-dev' 'ocaml-deriving-ocsigen' 'ocaml-js_of_ocaml' 'ocaml-calendar')
makedepends=('ocaml-findlib')
provides="ocaml-${srcname}"
conflicts="ocaml-${srcname}"
options=('!strip')
#install="${pkgname}.install"
source=("http://ocsigen.org/download/${srcname}-${pkgver//_/-}.tar.gz")
md5sums=('04a7fd438d4c95c7b505b358e1c31b10')

build() {
  cd "${srcdir}/${srcname}-${pkgver//_/-}"
  ./configure --prefix /usr \
              --temproot "$pkgdir" \

  make BINDIR="${pkgdir}/usr/bin"
  make BINDIR="${pkgdir}/usr/bin" doc
}


package() {
  mkdir -p "${pkgdir}/$(ocamlfind printconf destdir)"
  mkdir -p "${pkgdir}/usr/bin"

  cd "$srcdir/${srcname}-${pkgver//_/-}"
  make BINDIR="${pkgdir}/usr/bin" install
  make BINDIR="${pkgdir}/usr/bin" install.doc
}
