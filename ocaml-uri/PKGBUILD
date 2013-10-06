# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='uri'
pkgname="ocaml-${srcname}"
pkgver='1.3.8'
pkgrel=1
pkgdesc='Uri parsing library'
arch=('i686' 'x86_64')
url='https://github.com/avsm/ocaml-uri'
license=('custom')
depends=('ocaml')
makedepends=('ocaml-findlib')
options=('!strip')
source=("$pkgname::git+https://github.com/avsm/ocaml-uri.git#tag=$pkgname-$pkgver")


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
