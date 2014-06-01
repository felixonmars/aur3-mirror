# Maintainer: Keith Hughitt <khughitt@umd.edu>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python-pandas
pkgver=0.14.0
pkgrel=1
pkgdesc="Cross-section and time series data analysis toolkit"
arch=('i686' 'x86_64')
url="http://pandas.pydata.org/"
license=('BSD')
depends=('python-numpy' 'python-dateutil' 'python-pytz')
makedepends=('python-setuptools' 'cython')
optdepends=('python-matplotlib: for plotting'
            'python-scipy: for miscellaneous statistical functions'
            'scikits-statsmodels: for parts of pandas.stats')
options=(!emptydirs)

source=("http://pypi.python.org/packages/source/p/pandas/pandas-${pkgver}.tar.gz")
md5sums=('b775987c0ceebcc8d5ace4a1241c967a')

build() {
  cd "$srcdir"/pandas-$pkgver

  python setup.py build
}

package() {
  cd "$srcdir"/pandas-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

