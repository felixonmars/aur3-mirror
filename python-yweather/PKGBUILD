# Maintainer: Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>
_pkgname=yweather
pkgname=python-$_pkgname
pkgver=0.1
pkgrel=1
pkgdesc="An interface to the Yahoo! Weather RSS feed."
arch=("any")
url="http://pypi.python.org/pypi/yweather/0.1"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/y/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('08126197ccc7ffc3b91771124b75fa16')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
