# Maintainer: Thomas S Hatch <thatch45 at gmail dot com>
pkgname=ocaml-samplerate
pkgver=0.1.2
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="OCaml libs for samplerate."
url="http://savonet.sourceforge.net/"
depends=('ocaml')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags')
source=("http://downloads.sourceforge.net/savonet/${pkgname}-${pkgver}.tar.gz")
md5sums=('ea01e55b0c01aa0e03ded5fe4e24007a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}$(ocamlfind printconf destdir)
  make OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
    OCAMLFIND_LDCONF=ignore install
}
