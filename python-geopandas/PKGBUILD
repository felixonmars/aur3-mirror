# $Id$
# Maintainer: Brett L Kleinschmidt <blk@blk.me>
# Contributor: Brett L Kleinschmidt <blk@blk.me>

pkgbase=python-geopandas
pkgname=('python-geopandas' 'python2-geopandas')
pkgver=0.1.0
pkgrel=5
pkgdesc="Adds support for geographic data to pandas objects."
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/geopandas"
license=('BSD')
makedepends=('python' 'python2')
source=(https://pypi.python.org/packages/source/g/geopandas/geopandas-${pkgver}.tar.gz)
md5sums=('a148b99979bc5b87d4092cdc762b8d7e')

prepare() {
  cp -a "geopandas-$pkgver"{,-py2}
}

build() {
  cd "geopandas-$pkgver"
  python setup.py build

  cd "../geopandas-$pkgver-py2"
  python2 setup.py build
}

package_python-geopandas() {
  depends=('python' 'python-numpy' 'python-pandas>=0.13' 'python-shapely' 'python-fiona' 'python-six' 'python-pyproj')
  optdepends=('python-matplotlib: plotting functionality')

  cd "geopandas-$pkgver"
  python setup.py install --root="$pkgdir" -O1
}

package_python2-geopandas() {
  depends=('python2' 'python2-numpy' 'python2-pandas>=0.13' 'python2-shapely' 'python2-fiona' 'python2-six' 'python2-pyproj')
  optdepends=('python2-matplotlib: plotting functionality')

  cd "geopandas-$pkgver-py2"
  python2 setup.py install --root="$pkgdir" -O1
}

# vim:set ts=2 sw=2 et:
