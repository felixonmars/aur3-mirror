# Maintainer: Sebastien Leduc <sebastien AT sleduc.fr>
# Contributor: Marco Elver <marco.elver AT gmail.com>

pkgname=pygeoip
pkgver=0.3.0
pkgrel=1
pkgdesc="Pure Python GeoIP API"
arch=('any')
url='http://pypi.python.org/pypi/pygeoip'
license=('LGPL')
depends=('python2')
makedepends=('setuptools')
optdepends=('geoip-database: provides a database for geoip lookups')
source=("http://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('67eaa75053d06f46722eac23dc4e4bb5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
