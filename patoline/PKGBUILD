# Maintainer: Rodolphe Lepigre <rodolphe.lepigre@univ-savoie.fr>
pkgname=patoline
pkgver=1
pkgrel=1
pkgdesc="Modern typesetting system written in OCaml, alternative to TeX/LaTex"
arch=('any')
url="http://www.patoline.org"
license=('GPL3')
depends=('ocaml' 'ocaml-findlib' 'dypgen' 'ocaml-camomile' 'camlimages' 'ocaml-zip')
optdepends=('ocaml-cairo-git: cairo driver'
            'ocaml-lablgl: openGL driver'
            'ocamlnet: presentation control unsing websockets'
            'ocaml-sqlite3: bibliography support using bibi')
options=(!strip)
source=(http://patoline.org/darcs/patoline/patoline-current.tar.gz)
md5sums=('0dd7935e118431beaa3b216c052aee01')

build() {
	cd "$srcdir/$pkgname-current"
	ocaml configure.ml
	make
}

package() {
	cd "$srcdir/$pkgname-current"
	make DESTDIR="$pkgdir/" install
}
