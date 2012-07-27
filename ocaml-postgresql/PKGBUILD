# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-postgresql
_pkgname=postgresql-ocaml
pkgver=2.0.2
pkgrel=2
pkgdesc="OCaml interface to the PostgreSQL database"
arch=('i686' 'x86_64')
url=("http://www.ocaml.info/home/ocaml_sources.html")
license=('LGPL')
depends=('ocaml' 'ocaml-findlib' 'postgresql')
makedepends=('ocaml' 'texlive-core' 'texlive-latexextra' 'ghostscript')
conflicts=('postgresql-ocaml')
source=(https://bitbucket.org/mmottl/${_pkgname}/downloads/${_pkgname}-${pkgver}.tar.gz)
md5sums=('2998844efa24f1402c54897869ee4ead')

_pkgdir="${_pkgname}-${pkgver}"

build () {
  cd "${srcdir}/${_pkgdir}"

  ./configure --disable-debug --prefix /usr --destdir "$pkgdir"
   make all
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
  make install
  #install -d -m 0755 "${pkgdir}/usr/share/doc/ocaml-postgresql/html"
  #install -t "${pkgdir}/usr/share/doc/ocaml-postgresql/html" doc/postgresql/html/*
  #install -T doc/postgresql/latex/doc.pdf "${pkgdir}/usr/share/doc/ocaml-postgresql/ocaml-postgresql.pdf"
}
