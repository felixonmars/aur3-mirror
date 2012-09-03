# -*- shell-script -*-
# Maintainer: Eric Schulte <eric.schulte@gmx.com>
# Contributor: Eric Schulte <eric.schulte@gmx.com>
pkgname=cil
pkgver=1.5.0
pkgrel=1
pkgdesc="C Intermediate Language for C program analysis."
arch=('i686' 'x86_64')
url="http://kerneis.github.com/cil/"
license=('GPL')
depends=('ocaml>=3.08')
makedepends=('ocaml>=3.08' 'ocaml-findlib')
provides=(cil)
source=(http://iweb.dl.sourceforge.net/project/cil/cil/cil-1.5.0.tar.gz)
options=('!strip')
md5sums=('5564f5897d1ca133385955c2f68bae23')

OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "$OCAMLFIND_DESTDIR"
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  env DESTDIR="${pkgdir}" \
      OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR" \
      make install
}
