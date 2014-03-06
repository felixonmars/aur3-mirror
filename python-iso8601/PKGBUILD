# Contributor: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>

_name=iso8601
pkgname="python-${_name}"
pkgver=0.1.10
pkgrel=1
pkgdesc='Simple Python 3 module to parse ISO 8601 dates'
arch=('any')
url="https://pypi.python.org/pypi/${_name}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=('!emptydirs')
source=("https://pypi.python.org/packages/source/i/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('23acb1029acfef9c32069c6c851c3a41')

package() {
	cd "${_name}-${pkgver}"
	python setup.py install --prefix=/usr --root="${pkgdir}"
}
