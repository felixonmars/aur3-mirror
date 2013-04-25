#Maintainer: Charles E. Hawkins <charlesthehawk at yahoo dot com>
# Contributor: kfgz <kfgz at interia pl>

pkgname=ocaml-aacplus
pkgver=0.2.1
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="OCaml Bindings to the aacplus library."
url="http://savonet.sourceforge.net/"
depends=()
makedepends=('ocaml' 'ocaml-findlib' 'libaacplus')
options=('!strip' '!makeflags')
source=("http://downloads.sourceforge.net/savonet/${pkgname}-${pkgver}.tar.gz")
md5sums=('d917e5fdb9d96d659eca79841c8934c0')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  mkdir -p ${pkgdir}$(ocamlfind printconf destdir)
  make \
    OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
    OCAMLFIND_LDCONF=ignore \
    install
}
