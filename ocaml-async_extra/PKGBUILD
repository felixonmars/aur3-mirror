# Maintainer: Aaron Chen <nextAaron at gmail.com>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>

_pkgname=async_extra
pkgname=ocaml-$_pkgname
pkgver=109.15.00
pkgrel=1
pkgdesc="Jane Street Capital's asynchronous execution library (extra)"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('ocaml>=3.12' 'ocaml-async_unix>=109.15.00')
makedepends=('ocaml-findlib')
options=(!strip !makeflags)
url="http://janestreet.github.com"
source=("http://ocaml.janestreet.com/ocaml-core/$pkgver/individual/$_pkgname-$pkgver.tar.gz")
md5sums=('56f669fc3ea1a3a7f3b07cef3a5bf1f7')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --disable-debug --prefix /usr --destdir "$pkgdir"
  make all
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR/stublibs"
  make install
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
