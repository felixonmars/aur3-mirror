# Maintainer: Thibault Suzanne <thi [DOT] suzanne [AT] gmail [DOT] com>

_srcname="glMLite"
pkgname=ocaml-glmlite
pkgver=0.03.51
pkgrel=5
pkgdesc="OpenGL binding for OCaml"
url="http://www.linux-nantes.org/~fmonnier/ocaml/GL/"
arch=('any')
license=('MIT')
depends=("ocaml")
source=("${url}download/${_srcname}-${pkgver}.tgz")
md5sums=('9189dcb5c10a86c8b6b2558e03962a04')
options=("!makeflags")

build() {
  cd "$srcdir/${_srcname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  make PREFIX="${pkgdir}/$(ocamlc -where)/glMLite" -e install
}
