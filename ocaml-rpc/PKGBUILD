# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=ocaml-rpc
pkgver=1.4.1
pkgrel=1
pkgdesc="libraries to deal with RPCs in ocaml."
arch=('x86_64' i686)
url="https://github.com/samoht/ocaml-rpc"
license=('custom')
depends=( ocaml-findlib ocaml-xmlm ocaml-type-conv ocaml-js_of_ocaml)
makedepends=('git')
source=($pkgname::git://github.com/samoht/ocaml-rpc#tag=$pkgver)
md5sums=('SKIP')
conflict=(ocaml-rpc-git)


build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -d $pkgdir/usr/lib/ocaml
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
