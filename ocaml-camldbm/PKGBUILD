# Maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='camldbm'
pkgname="ocaml-${srcname}"
pkgver='1.0'
pkgrel=1
pkgdesc='An abstract engine for text editing'
arch=('i686' 'x86_64')
url='http://forge.ocamlcore.org/projects/camldbm/'
license=('BSD')
depends=('ocaml')
makedepends=('ocaml-findlib')
source=('http://forge.ocamlcore.org/frs/download.php/728/camldbm-1.0.tgz'
        'Makefile.patch')
options=('!strip')
md5sums=('79a297c0e0c54fbb3c7e795359e5f902'
         '79f65eff4468aa1377ca3e81055ddfe5')

build() {
    cd "$srcdir/${srcname}-${pkgver}"
    patch -p0 < "$srcdir/Makefile.patch"
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
