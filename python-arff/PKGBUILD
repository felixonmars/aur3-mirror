# Maintainer: Jason St. John <jstjohn .. purdue . edu>

_pypi_name=arff
pkgname="python-${_pypi_name}"
pkgver=0.9
pkgrel=2
pkgdesc="Python package for reading and writing Weka arff files"
arch=('any')
url="https://pypi.python.org/pypi/${_pypi_name}"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-liac-arff')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/${_pypi_name:0:1}/${_pypi_name}/${_pypi_name}-${pkgver}.tar.gz")
md5sums=('72d95e6cdf24ccd19345382a4005a4d6')

package() {
	cd "${_pypi_name}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
