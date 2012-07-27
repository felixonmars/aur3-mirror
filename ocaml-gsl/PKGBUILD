# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Scott Smith <jcdenton513 at gmail dot com>
# Contributor: Roman Timushev <romikt@gmail.com>
pkgname=ocaml-gsl
pkgver=0.6.0
pkgrel=7
pkgdesc="GNU scientific library for OCaml"
arch=('i686' 'x86_64')
url="http://oandrieu.nerim.net/ocaml/gsl/"
license=('GPL')
depends=('ocaml' 'gsl>=1.9')
makedepends=('ocaml-findlib')
options=(!strip !makeflags)
source=(http://oandrieu.nerim.net/ocaml/gsl/ocamlgsl-$pkgver.tar.gz)
md5sums=('04795211d49c2fe1f59a5669f33ec5fc')

build() {
  cd "$srcdir/ocamlgsl-$pkgver"
  make || return 1
}

package() {
  cd "$srcdir/ocamlgsl-$pkgver"

  export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
  export OCAMLFIND_LDCONF="ignore"

  mkdir -p $OCAMLFIND_DESTDIR
  make install-findlib || return 1
  install -d -m 0755 "${pkgdir}/usr/share/doc/$pkgname"
  install -t "${pkgdir}/usr/share/doc/$pkgname" doc/*
  install -Dm 644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
