# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: David Moore <davidm@sjsoft.com>

pkgname=python-xlwt
pkgver=0.7.5
pkgrel=1
pkgdesc="Library to create spreadsheet files compatible with MS Excel 97/2000/XP/2003 XLS files"
license=('BSD')
arch=(any)
url="http://pypi.python.org/pypi/xlwt"
depends=('python2')
makedepends=('python2-setuptools')
# Conflicts until this package works with Python 3
conflicts=("python2-xlwt")
provides=("python2-xlwt")
source=("http://pypi.python.org/packages/source/x/xlwt/xlwt-$pkgver.tar.gz")
md5sums=('59cb5efd55319465dfcd25e6a485f03c')

build() {
  cd "$srcdir/xlwt-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/xlwt-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  find "$pkgdir" -name "*.py" -exec \
    sed -i '1s/python[[:space:]]*$/python2/' {} \;
  install -Dm644 licences.py \
    "$pkgdir/usr/share/licenses/$pkgname/licences.py"
}

