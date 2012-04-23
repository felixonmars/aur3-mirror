# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Sebastien Binet <binet@lblbox>
pkgname=python-numexpr
pkgver=2.0.1
pkgrel=1
pkgdesc="The numexpr package evaluates multiple-operator array expressions many times faster than NumPy can"
url="http://code.google.com/p/numexpr/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python2-numpy')
makedepends=('python2-distribute')
source=(http://numexpr.googlecode.com/files/numexpr-$pkgver.tar.gz)
md5sums=('5cdc05c2ef8761daeae8a3182e468ba4')

build() {
  cd "$srcdir"/numexpr-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/python2|" \
    $(find "${pkgdir}" -name '*.py')
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

