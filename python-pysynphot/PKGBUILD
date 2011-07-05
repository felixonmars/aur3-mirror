# Maintainer:  <clu>

pkgname=python-pysynphot  
pkgver=0.8.3
pkgrel=1 
pkgdesc="a synthetic photometry software package suitable for either library or interactive use"
url="https://trac6.assembla.com/astrolib"
arch=('any')
license=('BSD')
depends=('python2>=2.3' 'python2-numpy>=1.0' 'python-pyfits>=1.1' 'python2-matplotlib>=0.9')
makedepends=('python2>=2.3' 'python2-distribute')
conflicts=()
replaces=()
backup=()
source=(http://stsdas.stsci.edu/astrolib/pysynphot-${pkgver}.tar.gz)
md5sums=('19843e5945714db00fdd55c83d8feb61')

build() {
  cd $srcdir/pysynphot-0.8.3
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
