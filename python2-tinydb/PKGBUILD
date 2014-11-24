# Maintainer: ammon117@gmail.com

pkgname=python2-tinydb
pkgver=2.2.0
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="TinyDB is a tiny, document oriented database optimized for your happiness."
url="https://github.com/msiemens/tinydb"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h')
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.zip)

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install -O1 --skip-build --root="$pkgdir"
}

sha256sums=('30e46ccedfe848a0f60de7a4a3dcd9025ba7ba4c870f0c4b6830725b52ab585e')
