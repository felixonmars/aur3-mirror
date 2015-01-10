# Maintainer: Fazlul Shahriar <fshahriar@gmail.com>
#
# Repository: https://github.com/fhs/archlinux-packages
pkgname=python2-igraph
pkgver=0.7.0
pkgrel=1
pkgdesc="A python library for creating and manipulating (un)directed graphs."
arch=('i686' 'x86_64')
url="http://igraph.org/python/"
license=('GPL2')
depends=('python2' 'igraph')
_archivename=python-igraph
source=("http://igraph.org/nightly/get/python/$_archivename-${pkgver}.tar.gz")
md5sums=('32a3238cb9041b1686d7d0ba152235bf')

build() {
  cd "$srcdir/$_archivename-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_archivename-$pkgver"
  python2 setup.py install --root=$pkgdir --optimize=1

  # fix conflict with python-igraph
  mv $pkgdir/usr/bin/igraph $pkgdir/usr/bin/igraph2

  sed -i '1s%^\(#!/usr/bin/env python\)$%\12%' $pkgdir/usr/lib/python2.7/site-packages/igraph/vendor/texttable.py
}

# vim:set ts=2 sw=2 et:
