# Maintainer: deon.spengler@gmail.com
pkgname=python-npyscreen
pkgver=4.8.4
pkgrel=1
_libname=${pkgname/python-/}
pkgdesc="This library provides a framework for developing console applications using Python and curses."
url="https://code.google.com/p/npyscreen/"
license=('BSD-3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)

build() {
	cd "$srcdir/$_libname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python setup.py install -O1 --skip-build --root="$pkgdir"
}

md5sums=('c610db9f9e922918a0f9b4e412aa93b8')

