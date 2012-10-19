# Maintainer: Charles E. Hawkins <charlesthehawk at yahoo dot com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>
pkgname=ocaml-pulseaudio
pkgver=0.1.2
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="OCaml libs for pulseaudio."
url="http://savonet.sourceforge.net/"
depends=('libpulse')
makedepends=('ocaml' 'ocaml-findlib')
options=('!strip' '!makeflags')
source=("http://downloads.sourceforge.net/savonet/${pkgname}-${pkgver}.tar.gz")
md5sums=('e2161f08741d07ca08915b77ad1a5b0d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/examples
  cp -a examples/* ${pkgdir}/usr/share/doc/${pkgname}/examples
  mkdir -p ${pkgdir}$(ocamlfind printconf destdir)
  make \
    OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
    OCAMLFIND_LDCONF=ignore \
    install
}
