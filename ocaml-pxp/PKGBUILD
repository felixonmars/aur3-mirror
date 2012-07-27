# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor:  Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>

pkgname=ocaml-pxp
pkgver=1.2.3
pkgrel=2
pkgdesc="An XML parser for OCaml"
arch=('i686' 'x86_64')
url="http://projects.camlcity.org/projects/pxp.html"
license=('GPL')
depends=('ocaml' 'ocamlnet' 'ocaml-findlib')
source=(http://download.camlcity.org/download/pxp-$pkgver.tar.gz)
md5sums=('83347420dae0ee495bb0ac2fbab7b74b')
options=('!strip' '!makeflags')

build(){
  cd "$srcdir/pxp-$pkgver"

  ./configure
  make all opt || return 1
}

package(){
  cd "$srcdir/pxp-$pkgver"

  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"
  env DESTDIR="$pkgdir" \
      OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
      make install
}
