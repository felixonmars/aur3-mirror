# Maintainer: ammon117 - at - gmail

pkgname=python2-pycouchdb
pkgver=1.9
pkgrel=1
provides=('python2-pycouchdb')
conflicts=('python2-pycouchdb' 'python2-couchdb')
depends=('couchdb' 'python2' 'python2-requests')
pkgdesc="Modern pure python CouchDB Client."
url="https://github.com/niwibe/py-couchdb"
license=('BSD')
arch=('i686' 'x86_64' 'armv6h')
_libname=${pkgname/python2-/}
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install -O1 --skip-build --root="$pkgdir"
}

sha256sums=('34e5a43a0360953efe247e6d2a91b5bac9092468f1c2af01edf033243d0b7be0')

