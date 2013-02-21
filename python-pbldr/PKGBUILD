# Maintainer: Jesus Alvarez
pkgname=python-pbldr
pkgver=0.3.3
pkgrel=1
pkgdesc="An automated package builder for Arch Linux."
arch=('x86_64' 'i686')
url="https://github.com/demizer/pbldr"
license=('MIT')
depends=('python')
source=("http://pypi.python.org/packages/source/p/pbldr/pbldr-${pkgver}.tar.gz")
md5sums=('66199414b4e9ecd377d688745ef84d14')

package() {
  cd "$srcdir/pbldr-$pkgver"
  # sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" setup.py
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
