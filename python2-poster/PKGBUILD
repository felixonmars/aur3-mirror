# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=python2-poster
pkgver=0.8.1
pkgrel=1
pkgdesc="A set of classes and functions to faciliate making HTTP POST (or PUT) requests using the standard multipart/form-data encoding in Python with urllib2"
arch=(any)
url="http://atlee.ca/software/poster/"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=(http://atlee.ca/software/poster/dist/$pkgver/poster-$pkgver.tar.gz)
md5sums=('2db12704538781fbaa7e63f1505d6fc8')
sha256sums=('af5bf45da4a916db2b638cffd9e9d6668b33020e2b8ca9f864db79b49331c6ff')

build() {
  cd "$srcdir/poster-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/poster-$pkgver"
  python2 setup.py install --root="$pkgdir"

  # Patch to use python2
  find $pkgdir -type f \( -name '*.py' -or -executable \) -exec \
    sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
           -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    \{\} +
}
