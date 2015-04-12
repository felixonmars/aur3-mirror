pkgname=python-geoalchemy2
_pkgname=GeoAlchemy2
pkgver=0.2.4
pkgrel=1
pkgdesc="GeoAlchemy provides extensions to SQLAlchemy to work with spatial databases."
arch=('any')
url="http://geoalchemy-2.readthedocs.org"
license=('MIT')
depends=('python-sqlalchemy>=0.8')
optdepends=('python-psycopg2: postgis support')
makedepends=('python-distribute')
source=("https://pypi.python.org/packages/source/G/GeoAlchemy2/GeoAlchemy2-${pkgver}.tar.gz")
md5sums=('2a7203f3ac614bc8758afa8f43a99154')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}

