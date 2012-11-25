# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
pkgname=ocaml-sha
pkgver=1.8
pkgrel=2
pkgdesc="OCaml SHA 1 and 2 family implementation using a really fast C implementation"
arch=('i686' 'x86_64')
url="https://github.com/vincenthz/ocaml-sha"
license=('LGPL')
depends=('ocaml')
source=(https://github.com/vincenthz/ocaml-sha/archive/v$pkgver.tar.gz)
md5sums=('acdd0a08eb396cdfc002f3c4fee6245e')
options=(!strip !makeflags)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make all doc || return 1
}

package(){
  cd "$srcdir/$pkgname-$pkgver"

  OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p $OCAMLFIND_DESTDIR
  OCAMLFIND_LDCONF=ignore OCAMLFIND_DESTDIR=$OCAMLFIND_DESTDIR make install
  install -d -m 0755 "${pkgdir}/usr/share/doc/$pkgname"
  install -t "${pkgdir}/usr/share/doc/$pkgname/" html/*
}
