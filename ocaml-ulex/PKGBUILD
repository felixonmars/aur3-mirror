# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: François Lebigre <francois.lebigre@gmail.com>
pkgname=ocaml-ulex
pkgver=1.1
pkgrel=3
pkgdesc="lexer generator for Unicode and OCaml"
arch=(i686 x86_64)
url="http://www.cduce.org/download.html"
license=('MIT')
depends=('ocaml')
makedepends=('ocaml-findlib')
source=("http://www.cduce.org/download/ulex-$pkgver.tar.gz")
md5sums=('ce49a013bc4a0e085977a9fe157017bf')
options=(!strip)

build() {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"
  make all.opt doc
}

package() {
  cd "$srcdir/${pkgname/ocaml-/}-$pkgver"
  export OCAMLFIND_DESTDIR=$pkgdir$(ocamlfind printconf destdir)
  install -dm 755 "$OCAMLFIND_DESTDIR"
  make install
  install -d -m 0755 "${pkgdir}/usr/share/doc/$pkgname"
  install -t "${pkgdir}/usr/share/doc/$pkgname" *.html *.css
}
