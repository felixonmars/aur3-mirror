# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor:  tocer <tocer.deng@gmail.com>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python2-xlrd
pkgver=0.8.0
pkgrel=1
pkgdesc="A library for developers to use to extract data from Microsoft Excel (tm) spreadsheet files."
url="http://www.lexicon.net/sjmachin/xlrd.htm"
depends=('python2')
conflicts=("python-xlrd")
provides=("python-xlrd")
source=("http://pypi.python.org/packages/source/x/xlrd/xlrd-$pkgver.tar.gz")
md5sums=('32af399c1e8b4b1e0b4752bab069f00b')
arch=('any')
license=('BSD')

build() {
  cd "$srcdir/xlrd-$pkgver"
  python2 setup.py install --root="$pkgdir"
  sed -i '1i\#!/usr/bin/env python2' "$pkgdir/usr/bin/runxlrd.py"
}

package() {
  cd "$srcdir/xlrd-$pkgver"
  local docdir
  docdir="$pkgdir/usr/share/doc/$pkgname/"
  install -D -m644 "xlrd/licences.py" \
    "$pkgdir/usr/share/licenses/$pkgname/licences.py"
  chmod 755 "$pkgdir/usr/bin/runxlrd.py"
  mkdir -p "$docdir"
  cp -a xlrd/doc/* "$docdir"
}


