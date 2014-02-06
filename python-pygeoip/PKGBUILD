# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Felix Yan <felixonmars@gmail.com>

pkgname=python-pygeoip
_pypiname=pygeoip
pkgver=0.3.1
pkgrel=1
pkgdesc="Pure Python GeoIP API"
arch=('any')
url="http://pypi.python.org/pypi/$_pypiname"
license=('LGPL')
depends=('python')
makedepends=('python-distribute')
optdepends=('geoip-database: provides a database for geoip lookups')

source=("http://pypi.python.org/packages/source/p/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('f31d44b7dd955f756edda64763c8f069')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
