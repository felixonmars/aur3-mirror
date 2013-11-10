# Maintainer: Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>
_pkgname=patsy
pkgname=python-$_pkgname
pkgver=0.2.1
pkgrel=1
pkgdesc="A Python package for describing statistical models and for building design matrices."
arch=("any")
url="https://github.com/pydata/patsy"
license=('BSD')
depends=('python-numpy')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('ea36c846d62231e41df684a827a5fd58')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
