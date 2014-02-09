# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-pandas
pkgver=0.13.1
pkgrel=1
pkgdesc="Cross-section and time series data analysis toolkit"
arch=('i686' 'x86_64')
url="http://pandas.pydata.org/"
license=('BSD')
depends=('python2-numpy>=1.6.1' 'python2-dateutil>=1.5' 'python2-pytz')
makedepends=('python2-nose' 'cython2>=0.17.1')
optdepends=('python2-numexpr: for accelerating certain numerical operations (recommended)'
            'python2-bottleneck: for accelerating certain types of nan evaluations (recommended)'
            'python2-scipy: for miscellaneous statistical functions'
            'python2-pytables: for HDF5-based storage'
            'python2-matplotlib: for plotting'
            'scikits-statsmodels: for parts of pandas.stats'
            'python2-openpyxl>=1.6.1: for Excel I/O'
            'python2-xlrd: for Excel I/O'
            'python2-xlwt: for Excel I/O'
            'python2-boto: for Amazon S3 access'
            'python2-beautifulsoup4: for read_html function'
            'python2-html5lib: for read_html function'
            'python2-lxml: for read_html function')
options=(!emptydirs)

source=("https://github.com/pydata/pandas/releases/download/v$pkgver/pandas-$pkgver.tar.gz")
md5sums=('6abb69f6e88ff158244cd91965a54151')

build() {
  cd "$srcdir"/pandas-$pkgver

  python2 setup.py build_ext --inplace
  python2 setup.py build
}

#check() {
#  cd "$srcdir"/pandas-$pkgver
#
#  LANG=C nosetests2 pandas
#}

package() {
  cd "$srcdir"/pandas-$pkgver
  python2 setup.py install --root="$pkgdir"/ --optimize=1

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')

  install -D LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

