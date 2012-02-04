# Maintainer: spider-mario <spidermario@free.fr>
pkgname=obrowser
pkgver=1.1.1
pkgrel=1
pkgdesc="OCaml virtual machine written in Javascript, to run OCaml program in browsers"
arch=('i686' 'x86_64')
url="http://ocsigen.org/obrowser/"
license=('custom:"LGPL with linking exception"')
groups=('devel')
depends=('ocaml')
makedepends=('perl')
options=('!makeflags')
source=(http://ocsigen.org/download/$pkgname-$pkgver.tar.gz)
md5sums=('c2b67241ad48f6e1a207dfda9773b535')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make rt/caml/stdlib.cma vm.js
  pushd axo
    make
  popd
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
  mkdir -p "$OCAMLFIND_DESTDIR"

  ocamlfind install obrowser META vm.js rt/caml/stdlib.cma rt/caml/*.cmi rt/caml/std_exit.cmo axo/AXO.cma axo/AXO*.cmi
  install -m 644 rt/caml/dllstdlib.so "$OCAMLFIND_DESTDIR/obrowser"

  LICENSE_DESTDIR="$pkgdir/usr/share/licenses/obrowser/"
  mkdir -p "$LICENSE_DESTDIR"
  install rt/LICENSE "$LICENSE_DESTDIR"
}

# vim:set ts=2 sw=2 et:
