# Maintainer: Louis R. Marascio <lrm at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>

pkgname=quantlib-python
pkgver=1.0.1
pkgrel=2
pkgdesc="Python bindings for QuantLib, a free/open source library for quantitative finance."
arch=('i686' 'x86_64')
url="http://quantlib.org"
license=('BSD')
depends=('python' 'quantlib')
source=(http://downloads.sourceforge.net/quantlib/QuantLib-SWIG-1.0.tar.gz)
md5sums=('77029907e4ebf34c9c5dca6e1b4072a2')
_pkgdir="QuantLib-SWIG-1.0"

build() {
    cd "$srcdir/$_pkgdir/Python"
    python setup.py build
    python setup.py test
}

package() {
    cd "$srcdir/$_pkgdir/Python"
    python setup.py install --root=$pkgdir
    install -D -m644 ../LICENSE.TXT $pkgdir/usr/share/licenses/${pkgname}/LICENSE.TXT
}
