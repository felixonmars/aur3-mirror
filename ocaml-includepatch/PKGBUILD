# Maintainer: Leonard de Ruijter <leonard@aur.archlinux.org>
pkgname=ocaml-includepatch
pkgver=1.0
pkgrel=1
pkgdesc="OCAML saves its includefiles in /usr/lib/ocaml/caml. Due to the unusual location for these files which makes compiling certain libraries impossible, this package symlinks this path to /usr/include/caml"
arch=('i686' 'x86_64')
depends=('ocaml')
url='http://caml.inria.fr/ocaml/'
license=("custom")
package() {
	install -d $pkgdir/usr/include
	ln -s /usr/lib/ocaml/caml $pkgdir/usr/include/caml
}
# vim:set ts=2 sw=2 et:
