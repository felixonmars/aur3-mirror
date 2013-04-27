# Maintainer: Charles E. Hawkins <charlesthehawk at yahoo dot com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>
# Contributor: Luciano A. Ferrer <laferrer@gmail.com>
pkgname=ocaml-magic
pkgver=0.7.3
pkgrel=4
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="OCaml binding for libmagic (to determine the type of files)."
url="https://sourceforge.net/projects/ocaml-magic"
depends=('ocaml')
makedepends=('ocaml-findlib')
options=('!strip')
source=("http://downloads.sourceforge.net/ocaml-magic/${pkgname}-${pkgver}.tar.gz")
md5sums=('5b8a4d149fe8ce095ab8115f2e49beba')

OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

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
