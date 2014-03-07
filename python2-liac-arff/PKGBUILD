# Maintainer: Jason St. John <jstjohn .. purdue . edu>

_realname=liac-arff
pkgname="python2-${_realname}"
pkgver=2.0.1
pkgrel=1
pkgdesc="A library to read and write ARFF files in Python 2"
arch=('any')
url="https://pypi.python.org/pypi/${_realname}"
license=('MIT')
depends=('python2' 'python2-setuptools')
conflicts=('python2-arff')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/l/${_realname}/${_realname}-${pkgver}.zip")
md5sums=('827e53627d541fecc777f46c3e5c86be')

package() {
	cd "${_realname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
