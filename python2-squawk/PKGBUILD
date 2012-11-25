# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-squawk
pkgver=0.3.1
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="A python library and command line tool for running SQL queries against structured/semi-structured static files. "
url="http://github.com/samuel/squawk"
license=('BSD')
arch=('any')
depends=('python2-pyparsing')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/s/$_libname/$_libname-$pkgver.tar.gz")

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install -O1 --root="$pkgdir"

	install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('81e6c9633ebe353d45daba70e4a4f81b54d71f44fdbe1d1eb20f4fc5f47531b7')
