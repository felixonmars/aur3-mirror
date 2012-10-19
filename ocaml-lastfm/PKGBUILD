# Maintainer: Charles E. Hawkins <charlesthehawk at yahoo dot com>
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>

pkgname=ocaml-lastfm
pkgver=0.3.0
pkgrel=2
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="OCaml libs to access lastfm."
url="http://savonet.sourceforge.net/"
depends=()
makedepends=('ocaml' 'ocaml-findlib' 'ocaml-pcre')
options=('!strip' '!makeflags')
source=(${pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/savonet/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz/download)
md5sums=('b93778a4b67696b9bc22e3d68f8d0f5d')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/examples
  cp -a examples/*.ml ${pkgdir}/usr/share/doc/${pkgname}/examples/
  mkdir -p ${pkgdir}$(ocamlfind printconf destdir)
  make \
    OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
    OCAMLFIND_LDCONF=ignore \
    install
}
