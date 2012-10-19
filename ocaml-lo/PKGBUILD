# Maintainer: kfgz <kfgz at interia pl>

pkgname=ocaml-lo
pkgver=0.1.0
pkgrel=2
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="OCaml library supporting the OSC protocol to have external controls"
url="http://savonet.sourceforge.net/"
depends=('liblo' 'glibc')
makedepends=('ocaml' 'ocaml-findlib')
options=('!strip' '!makeflags')
source=(${pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/savonet/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz/download)
md5sums=('40a4538062f7985a988b63482968015d')

OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  mkdir -p ${OCAMLFIND_DESTDIR}
  make \
    OCAMLFIND_DESTDIR=${OCAMLFIND_DESTDIR} \
    OCAMLFIND_LDCONF=ignore \
    install
}
