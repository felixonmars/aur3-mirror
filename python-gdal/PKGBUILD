pkgname=python-gdal
pkgver=1.11.1
pkgrel=1
pkgdesc='Geospatial Data Abstraction Library'
url='https://pypi.python.org/pypi/GDAL/'
arch=('any')
license=('MIT')
depends=('python' 'gdal')
source=("https://pypi.python.org/packages/source/G/GDAL/GDAL-${pkgver}.tar.gz")
md5sums=('1a6b51c8e2dd5990007a33e081b8a057')

package() {
  cd GDAL-$pkgver
  python setup.py install --root="$pkgdir"
}
