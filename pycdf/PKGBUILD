# Contributor: Kostas Andreadis <kmandreadis@gmail.com>
pkgname=pycdf
pkgver=0.6
pkgrel=1
pkgdesc="Python interface to the Unidata NetCDF library."
arch=('i686')
url="http://pysclint.sourceforge.net/pycdf"
license=('Python')
depends=('python' 'python-numpy')
makedepends=('netcdf')
source=(http://downloads.sourceforge.net/sourceforge/pysclint/$pkgname-$pkgver-3b.tar.gz)
md5sums=('5560a6e0b8de9c743782bad49e1b7957')

build() {
  cd $startdir/src/$pkgname-$pkgver-3b
  python setup.py install --root=$startdir/pkg || return 1
}
