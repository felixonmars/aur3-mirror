# Maintainer: David J. Haines <djhaines at gmx dot com>

_pkgname=retrying
pkgname=python2-${_pkgname}-git
pkgver=0
pkgrel=1
pkgdesc="A general purpose Python retyring library"
url="https://github.com/rholder/${_pkgname}"
depends=('python2-google-api-python-client' 'python2-docopt' 'python2-dateutil' 'python2-retrying')
makedepends=()
conflicts=("${pkgname:0:-4}")
provides=("${pkgname:0:-4}")
license=('APACHE')
arch=('any')
source=("${_pkgname}::git+https://github.com/rholder/retrying.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd ${_pkgname}
	python2 setup.py build
}

package() {
	cd ${_pkgname}
    python2 setup.py install --root="${pkgdir}" --optimize=1 
}
