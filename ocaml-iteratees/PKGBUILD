# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

pkgname=ocaml-iteratees
pkgver=0.3
pkgrel=2
pkgdesc="A port of Oleg Kiselyov's iteratees to OCaml"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('ocaml>=3.12'
         'ocaml-lwt>=2.3.2')
makedepends=('ocaml-findlib')
options=(!strip !makeflags)
url="http://forge.ocamlcore.org/projects/ocaml-iteratees/"
source=("http://forge.ocamlcore.org/frs/download.php/628/$pkgname-$pkgver.tar.bz2")
md5sums=('e877b41c9263282f8e9b62f46d01d8a1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR/stublibs"
  make install
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
