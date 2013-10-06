# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='re'
pkgname=ocaml-$srcname
pkgver=1.2.1
pkgrel=1
pkgdesc='A regular expression library for OCaml.'
arch=('i686' 'x86_64')
url='https://github.com/ocaml/ocaml-re'
license=('LGPL')
depends=('ocaml')
makedepends=('ocaml-findlib')
provides=(ocaml-re)
options=('!strip')
source=("$pkgname::git://github.com/ocaml/ocaml-re.git#tag=$pkgname-$pkgver")
md5sums=('SKIP')


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
