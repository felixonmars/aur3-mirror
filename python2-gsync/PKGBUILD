# Maintainer: David J. Haines <djhaines at gmx dot com>

_pkgname=gsync
pkgname=python2-${_pkgname}
pkgver=0.1.14
pkgrel=1
pkgdesc='GSync - RSync for Google Drive'
url='https://github.com/iwonbigbro/gsync'
arch=('any')
license=('BSD')
makedepends=('python2-setuptools')
depends=('python2-google-api-python-client' 'python2-dateutil' 'python2-docopt')
source=("https://pypi.python.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('86a8b88d5cbe66789fdb67552ae86ac5')

build() {
	cd ${_pkgname}-${pkgver}
	python2 setup.py build
}

package() {
	cd ${_pkgname}-${pkgver}
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
