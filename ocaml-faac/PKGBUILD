# Maintainer: Thomas S Hatch <thatch45 at gmail dot com>
pkgname=ocaml-faac
pkgver=0.1.2
pkgrel=2
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="OCaml libs for faac."
url="http://savonet.sourceforge.net/"
depends=('ocaml')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags')
source=("http://downloads.sourceforge.net/savonet/${pkgname}-${pkgver}.tar.gz")
md5sums=('df7cdfb831e69cd0fb33e12449f978f3')

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
