# Maintainer: Charles E. Hawkins <charlesthehawk at yahoo dot com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>
# Contributor: Luciano A. Ferrer <laferrer@gmail.com>
pkgname=ocaml-cry
pkgver=0.2.2
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="This OCaml module is used to interact with icecast2 and shoutcast servers."
url="http://savonet.sourceforge.net/"
depends=()
makedepends=('ocaml' 'ocaml-findlib')
source=("http://downloads.sourceforge.net/savonet/${pkgname}-${pkgver}.tar.gz")
md5sums=('1de9dda722710f939b08ab68fb77a4bc')

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
  make OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) install
}
