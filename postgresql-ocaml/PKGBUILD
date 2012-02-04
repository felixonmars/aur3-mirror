# Maintainer: Serge Ziryukin <ftrvxmtrx@gmail.com>

pkgname=postgresql-ocaml
pkgver=1.16.0
pkgrel=2
pkgdesc="OCaml interface to the PostgreSQL database"
arch=('i686' 'x86_64')
url=("http://www.ocaml.info/home/ocaml_sources.html")
license=('LGPL')
depends=('ocaml' 'ocaml-findlib' 'postgresql')
makedepends=('ocaml' 'texlive-core' 'texlive-latexextra' 'ghostscript')
source=(http://hg.ocaml.info/release/postgresql-ocaml/archive/release-${pkgver}.tar.bz2)
md5sums=('cf76ab4f3097ed0c7ef34a861ad6a3d1')
install=postgresql-ocaml.install

_pkgdir="${pkgname}-release-${pkgver}"

build () {
  OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

  cd "${srcdir}/${_pkgdir}"

  make all doc || return 1
  mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
  DESTDIR="${pkgdir}" OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}" make install || return 1
  install -d -m 0755 "${pkgdir}/usr/share/doc/postgresql-ocaml/html"
  install -t "${pkgdir}/usr/share/doc/postgresql-ocaml/html" doc/postgresql/html/*
  install -T doc/postgresql/latex/doc.pdf "${pkgdir}/usr/share/doc/postgresql-ocaml/postgresql-ocaml.pdf"
}
