# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>
pkgname=python2-statsmodels
pkgver=0.5.0
pkgrel=2
pkgdesc="Statistical computations and models for use with SciPy"
arch=('i686' 'x86_64')
url="http://statsmodels.sourceforge.net/"
license=('BSD')
depends=('python2-scipy' 'python2-pandas' 'python2-patsy')
optdepends=('python2-matplotlib: for plotting functions')
makedepends=('python2-setuptools')
conflicts=('scikits-statsmodels')
replaces=('scikits-statsmodels')
optdepends=('python2-matplotlib: plotting'
            'python-numdifftools: likelihood models for time series')
options=(!emptydirs)

source=("http://pypi.python.org/packages/source/s/statsmodels/statsmodels-${pkgver}.tar.gz")
md5sums=('c65454d97f869ac0e5bb3a2757ec6bd5')

build() {
  cd "$srcdir"/statsmodels-${pkgver}

  python2 setup.py build
}

package() {
  cd "$srcdir"/statsmodels-${pkgver}

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

