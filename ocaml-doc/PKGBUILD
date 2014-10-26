# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=ocaml-doc
pkgver=4.02
pkgrel=2
pkgdesc="Reference documentation for OCaml, HTML format"
arch=('any')
url="http://caml.inria.fr/index.en.html"
license=('unknown')
options=(!strip)
source=(http://caml.inria.fr/distrib/ocaml-$pkgver/ocaml-$pkgver-refman-html.tar.gz)
md5sums=('915a1949f7af7186e16354e9682dc1e5')
sha1sums=('0c782d587e146c3a0c9fa9dd5b96da718e549efb')
sha256sums=('1d3b7e5494c075d86c760f6320acba086d686e7409cb75f8267bccfb6ad5f3a8')

package() {
  cd "$srcdir/htmlman"

  mkdir -p $pkgdir/usr/share/doc/ocaml
  cp -r * $pkgdir/usr/share/doc/ocaml/
  chmod a+x $pkgdir/usr/share/doc/ocaml/libref

}

# vim:set ts=2 sw=2 et:
