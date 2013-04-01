# Maintainer: Aaron Chen <nextAaron at gmail.com>

_pkgname=async_find
pkgname=ocaml-$_pkgname
pkgver=109.15.00
pkgrel=2
pkgdesc="Directory traversal with Async"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('ocaml>=3.12' 'ocaml-async>=109.15.00')
makedepends=('ocaml-findlib')
options=(!strip !makeflags)
url="http://janestreet.github.com"
source=("http://ocaml.janestreet.com/ocaml-core/$pkgver/individual/$_pkgname-$pkgver.tar.gz")
md5sums=('a06bb1eef2313a3be56d13aa894c52bc')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --disable-debug --prefix /usr --destdir "$pkgdir"
  make all
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  mkdir -p "$OCAMLFIND_DESTDIR"
  make install
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
