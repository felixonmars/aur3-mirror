# Contributor: Kostas Andreadis <kmandreadis@gmail.com>
pkgname=ocaml-gnuplot
pkgver=0.8.3
pkgrel=3
pkgdesc="OCaml bindings to the GNUplot plotting package"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ocaml-gnuplot/"
license=('LGPL')
depends=('ocaml>=3.0.7' 'gnuplot>=4.0.0')
makedepends=('ocaml-findlib')
install=
source=(http://downloads.sourceforge.net/project/ocaml-gnuplot/ocaml-gnuplot/0.8.3/ocaml-gnuplot-0.8.3.tar.gz)
md5sums=('0494706c73028af9f64b5d73efb426a8')
options=(!strip)

package() {
  cd "$srcdir/${pkgname}-$pkgver"

  mkdir -p ${pkgdir}/usr/lib/ocaml/gnuplot/
  make  
  make OCAMLFIND_DESTDIR=${pkgdir}/usr/lib/ocaml/gnuplot/ install 
}

# vim:set ts=2 sw=2 et:
