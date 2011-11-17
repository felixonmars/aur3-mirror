# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='mikmatch'
pkgname="ocaml-${srcname}"
pkgver='1.0.4'
pkgrel=2
pkgdesc='Syntactic extension for OCaml to provide pattern matching with regular expressions'
arch=('i686' 'x86_64')
url='http://martin.jambon.free.fr/micmatch.html'
license=('BSD')
depends=('ocaml' 'ocaml-tophide')
makedepends=('ocaml-findlib')
source=("http://martin.jambon.free.fr/${srcname}-${pkgver}.tar.bz2")
options=('!strip')
md5sums=('97223f13a797683d6ef7ebd4888b6560')

build() {
    cd "$srcdir/${srcname}-${pkgver}"

    env PREFIX='/usr' make
}


package() {
    mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"
    cd "$srcdir/${srcname}-${pkgver}"

    env OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make install
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
