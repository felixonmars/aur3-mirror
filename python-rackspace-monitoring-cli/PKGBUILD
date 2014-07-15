# Maintainer: Carl George <carl@cgtx.us>

_module="rackspace-monitoring-cli"
pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.6.2"
pkgrel="1"
pkgdesc="Command Line Utility for Rackspace Cloud Monitoring"
arch=("any")
url="https://github.com/racker/${_name}"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_module:0:1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('d2e3f68169339d1d5b957f19c6d909745302d708058ac9e9e015be4a89f2ff01')

package_python-rackspace-monitoring-cli() {
	depends=("python-rackspace-monitoring")
	cd ${srcdir}/${_module}-${pkgver}
	python setup.py clean --all
	python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-rackspace-monitoring-cli() {
	depends=("python2-rackspace-monitoring")
	cd ${srcdir}/${_module}-${pkgver}
	python2 setup.py clean --all
	python2 setup.py install --root=${pkgdir} --optimize=1
}
