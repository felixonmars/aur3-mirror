# Contributor: Kostas Andreadis email: kmandreadis@gmail.com
pkgname=python-scientific
pkgver=2.9.0
pkgrel=1
pkgdesc="collection of Python modules for scientific computing"
arch=('i686' 'x86_64')
url="http://sourcesup.cru.fr/projects/scientific-py/"
license=('CUSTOM')
depends=(python netcdf python-numpy)
#makedepends=(python netcdf python-numpy)
source=(http://sourcesup.cru.fr/frs/download.php/2372/ScientificPython-$pkgver.tar.gz)
md5sums=('babbbb708d235094d75478bdeb8d4c7f')

build() {
  cd "$srcdir/ScientificPython-$pkgver"
  python setup.py build --numpy
  python setup.py install --prefix=/usr --root=$startdir/pkg
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
  install -m644 $startdir/src/ScientificPython-$pkgver/LICENSE $startdir/pkg/usr/share/licenses/$pkgname/
}




