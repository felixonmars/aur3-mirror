# Maintainer:  tocer <tocer.deng@gmail.com>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python-xlrd
pkgver=0.7.1
pkgrel=1
pkgdesc="A library for developers to use to extract data from Microsoft Excel (tm) spreadsheet files."
url="http://www.lexicon.net/sjmachin/xlrd.htm"
depends=('python')
source=(http://pypi.python.org/packages/source/x/xlrd/xlrd-$pkgver.tar.gz)
arch=('any')
license=('BSD')
md5sums=('d0439a7ad1ae583a6ba3942efd0189c8')

build() {
  cd $startdir/src/xlrd-$pkgver
  python setup.py install --root=$pkgdir
  sed -i '1i\#!/usr/bin/env python' $pkgdir/usr/bin/runxlrd.py
  chmod 755 $pkgdir/usr/bin/runxlrd.py
}

