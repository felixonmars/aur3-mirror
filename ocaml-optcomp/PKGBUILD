# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='optcomp'
pkgname="ocaml-${srcname}"
pkgver='1.4'
pkgrel=1
pkgdesc='A compiler of OCaml bytecode to Javascript'
arch=('i686' 'x86_64')
url='http://ocsigen.org/'
license=('LGPL')
depends=('ocaml')
makedepends=('ocaml-findlib')
provides=(ocaml-optcomp)
options=('!strip')
source=("https://forge.ocamlcore.org/frs/download.php/1011/optcomp-1.4.tar.gz")


build() {
    cd optcomp-$pkgver

    ./configure --prefix=/usr
    ocaml setup.ml -configure --destdir $pkgdir/usr/lib/ocaml
    ocaml setup.ml -build
}


package() {
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

  cd optcomp-$pkgver
  export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  ocaml setup.ml -install

}
md5sums=('696e603c47c9e02554ab659b57d1da56')
