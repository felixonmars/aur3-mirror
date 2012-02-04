# Maintainer: Filip Gruszczyński < gruszczy@gmail.com >
# Contributor: Alireza Savand < amu.alireza with love gmail>

pkgname=python-fathom
_pkgname=fathom
pkgver=0.4.1
pkgrel=1
pkgdesc="Fathom is Python3 package that provides database inspection. It creates an objective model of database schema and allows you to easily retrieve information about it"
arch=(any)
url="http://code.google.com/p/fathom"
license=('GPL3')
depends=('python' 'pyqt')
makedepends=('python3')
optdepends=('qfathom: graphical database inspection tool written using PyQt'
	    'python-fathom-tools: utilities for database schema inspection')
source=(http://fathom.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=('17ff431ca4fada4b0ce334073d1a25a8')

package() {
  cd "${srcdir}"/"${_pkgname}"-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
