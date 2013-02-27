# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='bolt'
pkgname="ocaml-${srcname}"
pkgver='1.4'
pkgrel=1
pkgdesc='A logging tool for the OCaml language that is modeled after log4j'
arch=('i686' 'x86_64')
url='http://bolt.x9c.fr/'
license=('LGPL3')
depends=('ocaml>=3.12.1')
makedepends=('ocaml-findlib')
source=("http://bolt.x9c.fr/distrib/bolt-${pkgver}.tar.gz")
options=('!strip')
sha256sums=('595c0441655a82b8e6d3d3f8dacf89e68d33c682dee62a97ea2eece4b5adc088')

build() {
    cd "$srcdir/${srcname}-${pkgver}"
    chmod +x configure
    ./configure

    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make all
}


package() {
    mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

    cd "$srcdir/${srcname}-${pkgver}"

    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make install
}
