# Maintainer: Charles E. Hawkins <charlesthehawk at yahoo dot com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>
# Contributor: Luciano A. Ferrer <laferrer@gmail.com>
pkgname=ocaml-alsa
pkgver=0.2.1
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="OCaml Bindings to the alsa library"
url="http://savonet.sourceforge.net/"
depends=('alsa-lib')
makedepends=('ocaml' 'ocaml-findlib')
options=('!strip')
source=("http://downloads.sourceforge.net/savonet/${pkgname}-${pkgver}.tar.gz")
md5sums=('4b0530df0d5eec061eeb56f4091fdba3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}$(ocamlfind printconf destdir)
  make \
    OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
    OCAMLFIND_LDCONF=ignore \
    install
}
