# Contributor: Guillem Rieu <guillemr@gmx.net>
pkgname=camlmix
pkgver=1.3.0
pkgrel=1
pkgdesc="A template system for OCaml."
arch=('i686' 'x86_64')
url="http://martin.jambon.free.fr/camlmix/"
license=('BSD')
depends=('ocaml')
source=(http://martin.jambon.free.fr/camlmix/$pkgname-$pkgver.tar.bz2)
md5sums=('fc15733c6fe98865de42935563a960d1')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  make PREFIX=$startdir/pkg/usr install
}

# vim:set ts=2 sw=2 et:
