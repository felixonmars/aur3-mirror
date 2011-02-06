# Maintainer: Thomas S Hatch <thatch45 at gmail dot com>
# Contributor: Massimiliano Brocchini <brocchini@netseven.it>

pkgname=ocaml-getopt
pkgver=20040811
pkgrel=4
pkgdesc="Command line parsing module similar to GNU GetOpt for Objective Caml (OCaml)"
arch=('i686' 'x86_64')
url="http://alain.frisch.fr/soft.html#Getopt"
license=('MIT')
depends=('ocaml')
makedepends=('ocaml-findlib')
source=(http://alain.frisch.fr/info/getopt-20040811.tar.gz)
md5sums=('3e9f5de83475c05141c6e281f49994d6')

DESTDIR="${pkgdir}$(ocamlfind printconf destdir)/getopt"
DOCDIR="${pkgdir}/usr/share/doc/${pkgname}"

build() {
  cd ${srcdir}/getopt
  make allopt
}

package () {
  cd ${srcdir}/getopt
  mkdir -p $DESTDIR
  mkdir -p $DOCDIR
  install -m 0644 getopt.{a,cmxa,cma,cmi,mli} META $DESTDIR
  "cp" -r sample.ml doc/* $DOCDIR
}
