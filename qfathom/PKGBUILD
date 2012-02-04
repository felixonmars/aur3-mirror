# Maintainer: Filip Gruszczyński < gruszczy@gmail.com >
# Contributor: Alireza Savand < amu.alireza with love gmail>

pkgname=qfathom
pkgver=0.1.0
pkgrel=1
pkgdesc="QFathom is graphical tool for database schema inspection written in python3 using PyQt4 framework"
arch=(any)
url="http://code.google.com/p/qfathom"
license=('GPL')
depends=('python' 'pyqt' 'python-fathom')
makedepends=('python3' 'pyqt')
optdepends=('python-fathom-tools: utilities for database schema inspection')
source=(http://qfathom.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=('a0878b0ac9cdf122a55057fece178953')

package() {
  cd "${srcdir}"/"${pkgname}"-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
