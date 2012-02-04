# Maintainer: Filip Gruszczyński < gruszczy@gmail.com >
# Contributor: Alireza Savand < amu.alireza with love gmail>

pkgname=python-qfathom
_pkgname=qfathom
pkgver=0.1.0
pkgrel=1
pkgdesc="database administration tool"
arch=(any)
url="http://code.google.com/p/qfathom"
license=('GPL')
depends=('python')
makedepends=('python')
source=(http://qfathom.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=('a0878b0ac9cdf122a55057fece178953')

package() {
  cd "${srcdir}"/"${_pkgname}"-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
