# Maintainer: Charles E. Hawkins <charlesthehawk at yahoo dot com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>
pkgname=ocaml-ladspa
pkgver=0.1.4
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="OCaml Bindings to the ladspa library"
url="http://savonet.sourceforge.net/"
depends=('glibc')
makedepends=('ocaml' 'ocaml-findlib' 'ladspa')
source=("http://downloads.sourceforge.net/savonet/${pkgname}-${pkgver}.tar.gz")
md5sums=('9931908da1bc7efd82ab83e4ab36c8ca')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
  cp -a examples ${pkgdir}/usr/share/doc/${pkgname}/
  mkdir -p ${pkgdir}$(ocamlfind printconf destdir)
  make \
    OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
    OCAMLFIND_LDCONF=ignore \
    install
}
