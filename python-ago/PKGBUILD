# Maintainer: Antonio Tauro <eye@eyenx.ch>

_pkgname=ago
pkgname=python-$_pkgname
pkgver=0.0.6
pkgrel=1
pkgdesc="Human readable timedeltas"
arch=("any")
license=("Public Domain")
url="https://bitbucket.org/russellballestrini/ago"
depends=("python")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("a64811a5a44cd3ba687d800986edf0f7a97859b8da75d3347c915b58b0869b44")

build(){
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}
package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
