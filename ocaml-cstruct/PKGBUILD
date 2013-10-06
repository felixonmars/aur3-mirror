# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='cstruct'
pkgname="ocaml-${srcname}"
pkgver=0.7.1
pkgrel=1
pkgdesc='Read and write low-level C-style structures in OCamla'
arch=('i686' 'x86_64')
url=https://github.com/mirage/ocaml-cstruct
license=('LGPL')
depends=('ocaml'
ocaml-ocplib-endian ocaml-lwt)
makedepends=('ocaml-findlib')
options=('!strip')
source=("$pkgname::git+https://github.com/mirage/ocaml-cstruct.git#tag=$pkgname-$pkgver")


build() {
    cd $pkgname

    ocaml setup.ml -configure --destdir $pkgdir/usr/lib/ocaml
    ocaml setup.ml -build
}


package() {
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)/stublibs"

  cd $pkgname
  export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  export OCAMLFIND_LDCONF=ignore
  ocaml setup.ml -install

}
md5sums=('SKIP')
