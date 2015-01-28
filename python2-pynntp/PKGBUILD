# Maintainer: Melissa Padilla <mpadilla2 at hotmail dot com>
pkgname=('python2-pynntp')
pkgver=0.8.4
pkgrel=2
pkgdesc="A python NNTP library"
url="https://pypi.python.org/pypi/pynntp"
arch=('any')
license=('GPL3')
depends=('python2')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/p/pynntp/pynntp-${pkgver}.tar.gz)
md5sums=('e41e0653581c6720ffa1b0f18c8a7a49')
sha256sums=('b8af347d60b49ed7d3f3c1f63d25589ca40225830b0746e8e87e64fffa202f38')

prepare() {
  cd "$srcdir/pynntp-$pkgver"
  find . -type f -exec sed -ri 's|^#!/usr/bin/python$|&2|g;s|#!/usr/bin/env python|#!/usr/bin/python2|' '{}' '+'
}

build() {
  cd "$srcdir/pynntp-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/pynntp-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
