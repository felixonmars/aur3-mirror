# Maintainer: Thomas S Hatch <thatch45 at gmail dot com>
pkgname=ocaml-ao
pkgver=0.2.0
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="OCaml interface for ao."
url="http://savonet.sourceforge.net/"
depends=('ocaml')
makedepends=('ocaml-findlib')
source=("http://downloads.sourceforge.net/savonet/${pkgname}-${pkgver}.tar.gz")
md5sums=('efd1e9aa49c42246765020f07ae4a903')

OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p $OCAMLFIND_DESTDIR
  make \
    OCAMLFIND_DESTDIR=$OCAMLFIND_DESTDIR \
    OCAMLFIND_LDCONF=ignore \
    install
}
