# Maintainer: kfgz <kfgz at interia pl>

pkgname=ocaml-voaacenc
pkgver=0.1.0
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="OCaml Bindings to the aac library."
url="http://savonet.sourceforge.net/"
depends=('ocaml')
makedepends=('ocaml-findlib' 'vo-aacenc')
options=('!strip' '!makeflags')
source=(${pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/savonet/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz/download)
md5sums=('b2cd855f586d4550758c3c6d4f28006d')

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
