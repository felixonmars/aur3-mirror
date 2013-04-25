# Maintainer: Charles E. Hawkins <charlesthehawk at yahoo dot com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>
pkgname=ocaml-gavl
pkgver=0.1.5
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="OCaml bindings for gavl."
url="http://savonet.sourceforge.net/"
depends=('gavl')
makedepends=('ocaml' 'ocaml-findlib' 'gavl')
source=("http://downloads.sourceforge.net/savonet/${pkgname}-${pkgver}.tar.gz")
md5sums=('f55a9984e05f32bffecdce21c6784943')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/examples
  cp -a examples/*.ml ${pkgdir}/usr/share/doc/${pkgname}/examples/
  mkdir -p ${pkgdir}$(ocamlfind printconf destdir)
  make \
    OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
    OCAMLFIND_LDCONF=ignore \
    install
}
