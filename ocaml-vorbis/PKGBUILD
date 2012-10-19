# Maintainer: Charles E. Hawkins <charlesthehawk at yahoo dot com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>
# Contributor: Luciano A. Ferrer <laferrer@gmail.com>
pkgname=ocaml-vorbis
pkgver=0.6.1
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="OCaml bindings for the ogg/vorbis library"
url="http://savonet.sourceforge.net/"
depends=('libvorbis')
makedepends=('ocaml' 'ocaml-findlib')

source=("http://downloads.sourceforge.net/savonet/${pkgname}-${pkgver}.tar.gz")
md5sums=('f56c3566d1485e5b5cb9aa75acbd9d0c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/examples
  cp -a examples/*.ml ${pkgdir}/usr/share/doc/${pkgname}/examples
  mkdir -p ${pkgdir}$(ocamlfind printconf destdir)
  make \
    OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
    OCAMLFIND_LDCONF=ignore \
    install
}
