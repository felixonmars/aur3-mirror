# Maintainer: Maximilian Köhl <mail@koehlma.de>
pkgname=python-daemon
pkgver=2.0.5
pkgrel=1
pkgdesc="Library to implement a well-behaved Unix daemon process"
license=("PSF")
url="http://pypi.python.org/pypi/python-daemon"
depends=('python-lockfile')
makedepends=('python-setuptools' 'python-docutils')
source=(http://pypi.python.org/packages/source/p/python-daemon/python-daemon-$pkgver.tar.gz)
arch=('any')

build() {
	cd "$srcdir/python-daemon-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/python-daemon-$pkgver"
	python setup.py install --skip-build -O1 --root="$pkgdir"
}

sha256sums=('afde4fa433d94d007206ee31a0941d55b5eb232a5422b670aad628547b46bf68')
