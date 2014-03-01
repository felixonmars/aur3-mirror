# Maintainer: ammon117 - at - gmail

pkgname=python-pycouchdb
pkgver=1.7
pkgrel=2
provides=('python-pycouchdb')
conflicts=('python-pycouchdb' 'python-couchdb')
depends=('couchdb' 'python' 'python-requests')
pkgdesc="Modern pure python CouchDB Client."
url="https://github.com/niwibe/py-couchdb"
license=('BSD')
arch=('i686' 'x86_64' 'armv6h')
_libname=${pkgname/python-/}
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)

build() {
	cd "$srcdir/$_libname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python setup.py install -O1 --skip-build --root="$pkgdir"
}

sha256sums=('2c144f2cad1ab052d707c93f39ed47b611eac8a83fd4a98d74a4c4ed3dd5ed1d')

