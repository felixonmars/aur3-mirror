# Maintainer: Aaron Chen <nextAaron at gmail.com>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>

_pkgname=async
pkgname=ocaml-$_pkgname
pkgver=109.15.00
pkgrel=1
pkgdesc="Jane Street Capital's asynchronous execution library"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('ocaml>=3.12' 'ocaml-async_extra>=109.15.00')
makedepends=('ocaml-findlib')
options=(!strip !makeflags)
url="http://janestreet.github.com"
source=("http://ocaml.janestreet.com/ocaml-core/$pkgver/individual/$_pkgname-$pkgver.tar.gz")
md5sums=('842f4102890b35fdb895fffacba75ca8')

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
