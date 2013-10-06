# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='uuidm'
pkgname=ocaml-$srcname
pkgver=0.9.5
pkgrel=1
pkgdesc='Implements 128 bits universally unique identifiers '
arch=('i686' 'x86_64')
url='http://erratique.ch/software/uuidm'
license=('BSD3')
depends=('ocaml')
makedepends=('ocaml-findlib')
provides=(ocaml-optcomp)
options=('!strip')
source=("http://erratique.ch/software/uuidm/releases/$srcname-$pkgver.tbz")


build() {
    cd $srcname-$pkgver

    ocaml setup.ml -configure --destdir $pkgdir/usr/lib/ocaml
    ocaml setup.ml -build
}


package() {
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

    cd $srcname-$pkgver
  export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  ocaml setup.ml -install

}
md5sums=('0ea5da95141c4e16480886d857591cd8')
