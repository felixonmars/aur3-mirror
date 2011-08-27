# Contributor: Guillem Rieu <guillemr@gmx.net>
# Contributor: Sergey Plaksin <serp256@gmail.com>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=menhir
pkgver=20090505
pkgrel=3
pkgdesc="Menhir is a LR(1) parser generator for the Objective Caml programming language."
arch=("i686" "x86_64")
url="http://cristal.inria.fr/~fpottier/menhir/"
license=('GPL' 'QPL')
depends=('ocaml>=3.09')
makedepends=('ocaml-findlib')
options=(!strip !makeflags)
source=(http://cristal.inria.fr/~fpottier/menhir/$pkgname-$pkgver.tar.gz)
md5sums=('68a026b30aca4098ffefc9ff9346df43')

OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$OCAMLFIND_DESTDIR"
  make PREFIX="/usr" all || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  env OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR" \
    make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
