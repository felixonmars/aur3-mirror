# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='cohttp'
pkgname=ocaml-${srcname}
pkgver=0.9.10
pkgrel=1
pkgdesc='OCaml library for creating HTTP daemons'
arch=('i686' 'x86_64')
url='https://github.com/avsm/ocaml-cohttp'
license=('LGPL')
depends=('ocaml' ocaml ocaml-findlib ocaml-obuild ocaml-uri)
makedepends=('ocaml-findlib')
options=('!strip')
source=("$pkgname::git+https://github.com/avsm/ocaml-cohttp.git#tag=$pkgname-$pkgver")


build() {

    cd $pkgname
    make build
}


package() {
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

  cd $pkgname
  export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  export OCAMLFIND_LDCONF=ignore
  ocaml setup.ml -install

}
md5sums=('SKIP')
