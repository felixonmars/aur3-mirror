# Maintainer: Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>
_pkgname=appdirs
pkgname=python2-$_pkgname
pkgver=1.4.0
pkgrel=1
pkgdesc="A small Python module for determining appropriate platform-specific dirs, e.g. a \"user data dir\""
arch=('any')
url="http://pypi.python.org/pypi/appdirs"
license=('GPL')
depends=('python2-setuptools')
makedepends=(unzip)
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/a/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('1d17b4c9694ab84794e228f28dc3275b')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
