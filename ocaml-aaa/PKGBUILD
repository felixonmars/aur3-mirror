#Contributor: Sergey Plaksin <serp256@gmail.com>

pkgname=ocaml-aaa
pkgver=0.9.1
pkgrel=1
pkgdesc="Batteries Included for OCaml stripped down version"
arch=('i686' 'x86_64')
url="https://forge.ocamlcore.org/projects/batteries/"
license=('LGPL')
depends=('ocaml' 'ocaml-findlib' 'ocaml-camomile' 'ocaml-ounit')
buld_depends=("omake")
source=(https://forge.ocamlcore.org/frs/download.php/334/aaa-batteries-$pkgver.tar.gz)
md5sums=('0af4bf33b0588c07b97b6b4222428551')

build() {
	cd $srcdir/aaa-batteries-$pkgver
	sed -i "s|/usr/share/doc/ocaml-aaa/|$pkgdir/usr/share/doc/$pkgname/|" OMakefile
	omake all || return 1
	omake doc
	mkdir -p $pkgdir$(ocamlfind printconf destdir)/aaa
	OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)" omake install
	omake install-doc
	install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
