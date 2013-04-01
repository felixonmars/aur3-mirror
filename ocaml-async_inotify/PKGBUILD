# Maintainer: Aaron Chen <nextAaron at gmail.com>

_pkgname=async_inotify
pkgname=ocaml-$_pkgname
pkgver=109.15.00
pkgrel=2
pkgdesc="Async wrapper for inotify"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('ocaml>=3.12' 'ocaml-async>=109.15.00' 'ocaml-inotify')
makedepends=('ocaml-findlib')
options=(!strip !makeflags)
url="http://janestreet.github.com"
source=("http://ocaml.janestreet.com/ocaml-core/$pkgver/individual/$_pkgname-$pkgver.tar.gz")
md5sums=('86244685537d20a711bc3cded99aaebc')

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
