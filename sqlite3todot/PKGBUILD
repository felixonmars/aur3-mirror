# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>

_rev=2ed5626
pkgname=sqlite3todot
pkgver=1
pkgrel=1
pkgdesc="convert sqlite3 databases to directed graph .dot files"
arch=('i686' 'x86_64')
url="http://github.com/chunky/sqlite3todot"
license=('custom')
makedepends=('sqlite3')
depends=('sqlite3')
options=()
source=(https://github.com/chunky/sqlite3todot/tarball/${_rev})
md5sums=('f38f33c56b4626e76a732eab4b4e5ade')

build() {
  cd ${srcdir}/chunky-sqlite3todot-${_rev}
  make
}

package() {
  cd ${srcdir}/chunky-sqlite3todot-${_rev}
  install -d ${pkgdir}/usr/bin
  install sqlite3todot ${pkgdir}/usr/bin
}
