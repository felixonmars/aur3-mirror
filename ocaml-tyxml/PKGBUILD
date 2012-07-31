# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='tyxml'
pkgname="ocaml-${srcname}"
pkgver='2.1'
pkgrel=1
pkgdesc='OCaml library that allows you to build XML trees whose validity is ensured by the typechecker'
arch=('i686' 'x86_64')
url='http://ocsigen.org/'
license=('LGPL')
depends=('ocaml' 'ocamlnet')
makedepends=('ocaml-findlib')
source=("http://ocsigen.org/download/${srcname}-${pkgver}.tar.gz")
options=('!strip')
md5sums=('d08f6864c444d8409b70edb68f0683ab')

build() {
    cd "$srcdir/${srcname}-${pkgver}"

    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make OCAMLDUCE=NO
}


package() {
    mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

    cd "$srcdir/${srcname}-${pkgver}"
    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make OCAMLDUCE=NO install
}
