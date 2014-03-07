# Maintainer: Jason St. John <jstjohn .. purdue . edu>

pkgname=python2-arff
pkgver=0.9
pkgrel=2
pkgdesc="Python package for reading and writing Weka arff files"
arch=('any')
url="https://pypi.python.org/pypi/arff"
license=('BSD')
depends=('python2')
conflicts=('python2-liac-arff')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/a/arff/arff-${pkgver}.tar.gz")
md5sums=('72d95e6cdf24ccd19345382a4005a4d6')

package() {
	cd "arff-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
