# Maintainer: Carl George <carl.george@rackspace.com>

_name="rackspace-monitoring-cli"
pkgname="python2-${_name}"
pkgver="0.6.2"
pkgrel="1"
pkgdesc="Command Line Utility for Rackspace Cloud Monitoring"
arch=("i686" "x86_64")
url="https://github.com/racker/${_name}"
license=("Apache")
depends=("python2-rackspace-monitoring")
provides=("${pkgname}=${pkgver}")
source=("https://pypi.python.org/packages/source/r/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=("d2e3f68169339d1d5b957f19c6d909745302d708058ac9e9e015be4a89f2ff01")

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python2 setup.py install --root=${pkgdir} --optimize=1 || return 1
}
