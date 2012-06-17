# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor:  tocer <tocer.deng@gmail.com>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python2-xlrd
pkgver=0.7.8
pkgrel=1
pkgdesc="A library for developers to use to extract data from Microsoft Excel (tm) spreadsheet files."
url="http://www.lexicon.net/sjmachin/xlrd.htm"
depends=('python2')
conflicts=("python-xlrd")
provides=("python-xlrd")
source=("http://pypi.python.org/packages/source/x/xlrd/xlrd-$pkgver.tar.gz")
md5sums=('071d9c39d3e12ad756ece4335c6d6f4a')
arch=('any')
license=('BSD')

build() {
  cd "$srcdir/xlrd-$pkgver"
  python2 setup.py install --root="$pkgdir"
  sed -i '1i\#!/usr/bin/env python2' "$pkgdir/usr/bin/runxlrd.py"
  chmod 755 "$pkgdir/usr/bin/runxlrd.py"
}

