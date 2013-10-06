# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='ocplib-endian'
pkgname="ocaml-${srcname}"
pkgver=0.4
pkgrel=1
pkgdesc='Optimised functions to read and write int16/32/64 from strings and bigarray'
arch=('i686' 'x86_64')
url=https://github.com/OCamlPro/ocplib-endian/
license=('LGPL')
depends=('ocaml' ocaml-optcomp)
makedepends=('ocaml-findlib')
options=('!strip')
source=("$pkgname::git+https://github.com/OCamlPro/ocplib-endian#tag=$pkgver")


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
