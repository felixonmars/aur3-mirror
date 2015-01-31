# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=python-peakutils
_pkgname=PeakUtils
pkgver=1.0.0
pkgrel=3
pkgdesc="Peak detection utilities for 1D data"
arch=('any')
url="https://pypi.python.org/pypi/PeakUtils"
license=('MIT')
groups=()
depends=('python' 'python-numpy>=1.8' 'python-scipy>=0.14')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/source/P/PeakUtils/$_pkgname-$pkgver.tar.gz)
md5sums=('c9a9d38d4aba137efdd79885d9f34290')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
