# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='xenstore'
pkgname="ocaml-${srcname}"
pkgver=1.2.5
pkgrel=1
pkgdesc='Xenstore protocol implementation in OCaml'
arch=('i686' 'x86_64')
url=https://github.com/mirage/ocaml-xenstore
license=('LGPL')
depends=('ocaml' ocaml-cstruct ocaml-lwt)
makedepends=('ocaml-findlib')
options=('!strip')
source=("$pkgname::git+https://github.com/mirage/ocaml-xenstore#tag=$pkgver")


build() {
    cd $pkgname

    ocaml setup.ml -configure --destdir $pkgdir/usr/lib/ocaml
    ocaml setup.ml -build
}


package() {
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

  cd $pkgname
  export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  ocaml setup.ml -install

}
md5sums=('SKIP')
