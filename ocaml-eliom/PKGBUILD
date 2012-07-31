# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='eliom'
pkgname="ocaml-${srcname}"
pkgver='2.2.2'
pkgrel=1
pkgdesc='An extensible Web server written in OCaml'
arch=('i686' 'x86_64')
url='http://ocsigen.org/'
license=('LGPL')
depends=('ocaml' 'ocaml-ocsigenserver>=2.1' 'ocaml-deriving-ocsigen>=0.3b' 'ocaml-js_of_ocaml>=1.2' 'ocaml-calendar')
makedepends=('ocaml-findlib')

provides="ocaml-${srcname}"
conflicts="ocaml-${srcname}"

options=('!strip')
source=("http://ocsigen.org/download/${srcname}-${pkgver}.tar.gz")
md5sums=('00010d67c5ba1d52680815015f8f6c6d')

build() {
  cd "${srcdir}/${srcname}-${pkgver}"
  chmod +x configure
  ./configure --prefix /usr \
              --temproot "$pkgdir" \

  make BINDIR="${pkgdir}/usr/bin"
  make BINDIR="${pkgdir}/usr/bin" doc
}


package() {
  mkdir -p "${pkgdir}/$(ocamlfind printconf destdir)"
  mkdir -p "${pkgdir}/usr/bin"

  cd "$srcdir/${srcname}-${pkgver}"
  make BINDIR="${pkgdir}/usr/bin" install
  make BINDIR="${pkgdir}/usr/bin" install.doc
}
