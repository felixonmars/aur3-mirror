# Maintainer: Jason St. John <jstjohn .. purdue . edu>

pkgname=python2-bayes
_pkgname=bayes
pkgver=0.1.1
pkgrel=2
pkgdesc="Bayes classification implementation"
arch=('any')
url="https://pypi.python.org/pypi/${_pkgname}/${pkgver}"
license=('unknown')
depends=('python2')
optdepends=('python2-redis: support for a Redis backend')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/b/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('0f493ec204d47b4cd4ef919b564541e2dab3f309b0fb11db91afe78f3da65d40eb8b9e199d63f09031251ce256755136d7db1d376994b2a22adc84c43145ab87')

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
}
