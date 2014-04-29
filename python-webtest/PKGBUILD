# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=WebTest
pkgname=python-${_pkgname,,}
pkgver=2.0.15
pkgrel=1
pkgdesc="Helper to test WSGI applications"
arch=("any")
url="http://webtest.pythonpaste.org/"
license=("MIT")
depends=("python-webob")
makedepends=("python-setuptools")
source=("http://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=("c320adc2cd862ea71ca9e2012e6157eb12f5f8d1632d1541f2eabf984aaa3ecc")

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 "docs/license.rst" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
