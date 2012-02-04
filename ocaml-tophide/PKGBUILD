# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='tophide'
pkgname="ocaml-${srcname}"
pkgver=1.0.0
pkgrel=1
pkgdesc='Hides toplevel values whose name starts with an underscore'
arch=('i686' 'x86_64')
url='http://martin.jambon.free.fr/ocaml.html'
license=('BSD')
depends=('ocaml')
makedepends=('ocaml-findlib')
source=("http://martin.jambon.free.fr/${srcname}-${pkgver}.tar.bz2")
options=('!strip')
md5sums=('0bed079eceefc522e3cd15cc5e982b69')

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
