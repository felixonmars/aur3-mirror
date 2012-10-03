# Maintainer: Mizuchi <ytj000@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Ryan Coyner <rcoyner@gmail.com>

pkgname=python-graph-docs
pkgver=1.8.2
pkgrel=1
pkgdesc="Set of HTML documentation for python-graph"
arch=('any')
url="http://code.google.com/p/python-graph/"
license=('MIT')
depends=()
makedepends=()
source=(http://python-graph.googlecode.com/files/python-graph-1.8.2.zip)
sha1sums=('7d7c5cb5bd85a4b2b0a6bc8bfe030cf908d5703e')

build() {
  # docs files
  install -m755 -d $pkgdir/usr/share/doc/python-graph/
  install -Dm644 $srcdir/python-graph/docs/* $pkgdir/usr/share/doc/python-graph/
  
  # Move COPYING to "licenses" dir
  install -m755 -d $pkgdir/usr/share/licenses/python-graph
  install -Dm644 $srcdir/python-graph/COPYING $pkgdir/usr/share/licenses/python-graph/
}
