# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-rsa
pkgver=3.1.1
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="Pure-Python RSA implementation"
arch=(any)
url="http://stuvel.eu/rsa"
license=('BSD')
depends=(python2-pyasn1)
makedepends=(python2-distribute)
source=(http://pypi.python.org/packages/source/r/$_libname/$_libname-$pkgver.tar.gz)

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install -O1 --root="$pkgdir"
	install -m0644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('01e6b88c078e8f74718a455e0a05623d')
