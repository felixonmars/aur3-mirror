# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='ocaml-text'
pkgname="${srcname}"
pkgver='0.6'
pkgrel=1
pkgdesc='A library for dealing with text in a convenient way'
arch=('i686' 'x86_64')
url='http://forge.ocamlcore.org/projects/ocaml-text/'
license=('BSD')
depends=('ocaml>=3.11.0')
makedepends=('ocaml-findlib')
source=('http://forge.ocamlcore.org/frs/download.php/937/ocaml-text-0.6.tar.gz')
options=('!strip')
md5sums=('86e4cb5849a01a34c21fad065501d696')

build() {
    cd "$srcdir/${srcname}-${pkgver}"
    ./configure

    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make
}


package() {
    mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"
    mkdir -p "$pkgdir/$(ocamlfind printconf destdir)/stublibs"
    cd "$srcdir/${srcname}-${pkgver}"
    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make install
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
