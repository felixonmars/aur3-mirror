# Maintainer: Filip Gruszczyński < gruszczy@gmail.com >
# Contributor: Alireza Savand < amu.alireza with love gmail>

pkgname=python-fathom-tools
_pkgname=fathom-tools
pkgver=0.1.0
pkgrel=1
pkgdesc="a Python 3 package with set of tools built on top of fathom library as well as utility functions useful for building further utilities for database schema inspection"
arch=(any)
url="http://code.google.com/p/fathom-tools"
license=('GPL3')
depends=('python' 'pyqt' 'python-fathom')
makedepends=('python3' 'pyqt')
optdepends=('qfathom: graphical database inspection tool written using PyQt')
source=(http://fathom-tools.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=('3709d8a9f816a16eae6bd111f8f0c1b4')

package() {
  cd "${srcdir}"/"${_pkgname}"-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
