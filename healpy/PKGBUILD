# Old Maintainer: Gero Müller <gero.mueller@physik.rwth-aachen.de>
# Maintainer: Sandro Vitenti <sandro@isoftware.com.br>

pkgname=healpy
pkgver=1.8.1
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
pkgdesc="Python package to manipulate healpix maps"
depends=('python2-numpy' 'python2-matplotlib' 'python2-astropy' 'python2' 'cfitsio')
makedepends=()
url="https://pypi.python.org/pypi/healpy"
md5sums=('1d1bccccea407eda4c366440ac09a3d7')
source=(
	https://pypi.python.org/packages/source/h/healpy/healpy-${pkgver}.tar.gz
)

package() {
  cd $srcdir/${pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
