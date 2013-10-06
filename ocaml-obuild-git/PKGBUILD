# Maintainer: Your Name <youremail@domain.com>
pkgname=ocaml-obuild-git
pkgver=0.0.3.2.g89fdf92
pkgver(){
  cd $pkgname
  git describe --tags --long | sed 's/-/./g;s/^v//'
}
pkgrel=1
pkgdesc="A parallel, incremental and declarative build system for OCaml."
arch=(i686 x86_64)
url="https://github.com/vincenthz/obuild"
license=('GPL')
depends=(ocaml ocaml-findlib)
makedepends=('git')
provides=(ocaml-obuild)
source=($pkgname::git://github.com/vincenthz/obuild.git)

build() {
  cd $pkgname
  ./bootstrap
}

package() {
  cd $pkgname
  install -d $pkgdir/usr/bin/
  install -Dm755 dist/build/obuild/obuild $pkgdir/usr/bin/
  install -Dm755 dist/build/obuild-simple/obuild-simple $pkgdir/usr/bin/
  install -Dm755 dist/build/obuild-from-oasis/obuild-from-oasis $pkgdir/usr/bin/
}

# vim:set ts=2 sw=2 et:
md5sums=('SKIP')
