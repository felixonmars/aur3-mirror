# maintainer: perlawk
pkgname=ocaml-ffi
_pkgname=ocamlffi
pkgver=1.6
pkgrel=1
pkgdesc="Objective Caml Foreign Function Interface Generator"
url="http://ocamlffi.sourceforge.net"
license=('GPL')
depends=('ocaml' 'libffi')
arch=('i686' 'x86_64')

source=("http://sourceforge.net/projects/ocamlffi/files/latest/download/${_pkgname}_${_pkgver}.tar.gz")

build() {
	cd "$srcdir"/ocamlffi/
	make
}

package() {
	cd "$srcdir"/ocamlffi/genffi
	mkdir -p "$pkgdir/usr/bin"
	cp genffi "$pkgdir/usr/bin"
}

md5sums=('c410c1d9ff61be1d714eedf96cb6020e')
