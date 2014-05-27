# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: tocer <tocer.deng@gmail.com>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python2-xlrd
pkgver=0.9.3
pkgrel=1
pkgdesc="A library for developers to use to extract data from Microsoft Excel (tm) spreadsheet files. [Python 2]"
url="http://www.python-excel.org/"
depends=('python2')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/x/xlrd/xlrd-$pkgver.tar.gz")
md5sums=('6f3325132f246594988171bc72e1a385')
arch=('any')
license=('BSD')

build() {
  cd "$srcdir/xlrd-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/xlrd-$pkgver"
  python2 setup.py install --root="$pkgdir"

  # Rename the Python 2 runlxrd.py to runxlrd2.py to not comflict with
  # python-xlrd
  mv "$pkgdir/usr/bin/runxlrd"{,2}.py

  # The docs were accidentally not included in the 0.9.3 tarball
#  local docdir="$pkgdir/usr/share/doc/$pkgname/"
#  mkdir -p "$docdir"
#  cp -a xlrd/doc/* xlrd/examples README.html "$docdir"

  install -D -m644 "xlrd/licences.py" \
    "$pkgdir/usr/share/licenses/$pkgname/licences.py"
}
