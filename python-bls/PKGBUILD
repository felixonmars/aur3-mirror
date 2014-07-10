# Maintainer: Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>
_pkgname=bls
pkgname=python-$_pkgname
pkgver=0.0.5
pkgrel=1
pkgdesc="A Python library for the Bureau of Labor Statistics API"
arch=('any')
url="https://github.com/oliversherouse/bls"
license=('GPL')
groups=()
depends=('python-pandas')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/bls/$_pkgname-$pkgver.tar.gz)
md5sums=('2212cc25ab68acc8b87d555c12d4de12')
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
