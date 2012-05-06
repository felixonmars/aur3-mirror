# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Guillem Rieu <guillemr@gmx.net>
pkgname=ocamlduce
pkgver=3.12.1
_name=cduce
_ver=0.5.5
pkgrel=1
pkgdesc="A modified version of OCaml with CDuce features."
arch=(i686 x86_64)
url="http://www.cduce.org/ocaml"
license=('custom:MIT')
groups=('devel')
depends=('ocaml' 'ocaml-findlib' 'ocaml-pcre' 'ocaml-ulex' 'ocamlnet' 'ocaml-pxp')
options=('!strip' '!makeflags')
source=(http://www.cduce.org/download/$_name-$_ver.tar.gz
        http://caml.inria.fr/pub/distrib/ocaml-${pkgver%.?}/ocaml-$pkgver.tar.gz)
md5sums=('bf9726a9cbc6287c807a8b1113f1e71f'
         '814a047085f0f901ab7d8e3a4b7a9e65')

build() {
  cd "$srcdir/$_name-$_ver"

  ./configure --prefix=/usr --mliface="$srcdir/ocaml-$pkgver"
  make
}

package() {
  cd "$srcdir/$_name-$_ver"

  export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"

  mkdir -p "$OCAMLFIND_DESTDIR"

  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man" DOCDIR="$pkgdir/usr/share/doc/ocamlduce" install

  mkdir -p "$pkgdir/usr/share/licenses/ocamlduce"
  install LICENSE "$pkgdir/usr/share/licenses/ocamlduce/"
}

# vim:set ts=2 sw=2 et:
