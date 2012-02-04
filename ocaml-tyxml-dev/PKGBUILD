# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='tyxml'
pkgname="ocaml-${srcname}-dev"
pkgver='2.0_rc2'
pkgrel=2
pkgdesc='OCaml library that allows you to build XML trees whose validity is ensured by the typechecker'
arch=('i686' 'x86_64')
url='http://ocsigen.org/'
license=('LGPL')
depends=('ocaml' 'ocamlnet')
makedepends=('ocaml-findlib')

provides="ocaml-${srcname}"
conflicts="ocaml-${srcname}"

source=("http://ocsigen.org/download/${srcname}-${pkgver//_/-}.tar.gz")
options=('!strip')
md5sums=('e64b472f9b379ba47effd721a7516250')

build() {
    cd "$srcdir/${srcname}-${pkgver//_/-}"

    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make OCAMLDUCE=NO
}


package() {
    mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

    cd "$srcdir/${srcname}-${pkgver//_/-}"
    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make OCAMLDUCE=NO install
}
