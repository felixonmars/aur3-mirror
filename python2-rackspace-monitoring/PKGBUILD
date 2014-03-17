# Maintainer: Carl George <carl.george@rackspace.com>

_name="rackspace-monitoring"
pkgname="python2-${_name}"
pkgver="0.6.0"
pkgrel="1"
pkgdesc="Client library for Rackspace Cloud Monitoring"
arch=("i686" "x86_64")
url="https://github.com/racker/${_name}"
license=("Apache")
depends=("python2" "apache-libcloud")
provides=("${pkgname}=${pkgver}")
source=("https://pypi.python.org/packages/source/r/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=("51380712a58798a7f76f765de5f544380a24d02bd25e36ac3e8786068d866478")

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python2 setup.py install --root=${pkgdir} --optimize=1 || return 1
}
