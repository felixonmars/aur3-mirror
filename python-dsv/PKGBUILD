# Contributor: cdhotfire <cdhotfire@gmail.com>

pkgname=python-dsv
pkgver=1.4.0
pkgrel=1
pkgdesc="Python module for importing and exporting DSV (delimiter separated values) files."
url="http://python-dsv.sourceforge.net/"
license="GPL"
depends=('wxpython' 'python')
source=(http://dl.sourceforge.net/sourceforge/python-dsv/DSV-$pkgver.tar.gz)
md5sums=('f811d5bb3173c22a093e6ef24fa7047e')

build() {
  cd $startdir/src/DSV-$pkgver
  python setup.py install --root=$startdir/pkg
}