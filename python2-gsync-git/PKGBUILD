# Maintainer: David J. Haines <djhaines at gmx dot com>

_pkgname=gsync
pkgname=python2-${_pkgname}-git
pkgver=0
pkgrel=1
pkgdesc="GSync - RSync for Google Drive"
url="https://github.com/iwonbigbro/${_pkgname}"
depends=('python2-google-api-python-client' 'python2-docopt' 'python2-dateutil' 'python2-retrying')
makedepends=('git' 'python2-setuptools')
conflicts=("python2-${_pkgname}")
provides=("python2-${_pkgname}")
license=('BSD')
arch=('any')
source=("${_pkgname}::git+https://github.com/iwonbigbro/gsync.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_pkgname}
	python2 setup.py build
}

package() {
	cd ${_pkgname}
    python2 setup.py install --root="${pkgdir}" --optimize=1 
}
