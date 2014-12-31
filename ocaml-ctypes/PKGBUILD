# Maintainer: Armin K. <krejzi at email dot com>

pkgname="ocaml-ctypes"
pkgver=0.3.4
pkgrel=1
pkgdesc='Library for binding to C libraries using pure OCaml'
arch=('i686' 'x86_64')
url=https://github.com/ocamllabs/ocaml-ctypes
license=('custom')
depends=('ocaml' 'libffi')
makedepends=('ocaml-findlib')
options=('!strip')
source=("https://github.com/ocamllabs/ocaml-ctypes/archive/${pkgver}.tar.gz")
sha256sums=('95b3c21a0348d9e17a30d834926e17e39447e58fe31a9a49e6d0289a0fcd3c43')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make -j1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -m755 -d "${pkgdir}/$(ocamlfind printconf destdir)/stublibs"
  export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  export OCAMLFIND_LDCONF=ignore
  make install
}
