# Maintainer: Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>
_pkgname=statsmodels
pkgname=python-$_pkgname
pkgver=0.5.0
pkgrel=1
pkgdesc="Statistical computations and models for use with SciPy"
arch=("any")
url="http://statsmodels.sourceforge.net"
license=('BSD')
depends=('python-pandas' 'python-patsy')
optdepends=("python-matplotlib: plotting")
makedepends=("cython")
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/s/$_pkgname/$_pkgname-$pkgver.tar.gz)
#source=(https://github.com/$_pkgname/$_pkgname/archive/v$pkgver.tar.gz)
md5sums=('c65454d97f869ac0e5bb3a2757ec6bd5')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python ./setup.py clean
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
