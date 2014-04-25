# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=Frozen-Flask
pkgname=python-${_pkgname,,}
pkgver=0.11
pkgrel=1
pkgdesc="Freezes a Flask application into a set of static files"
arch=("any")
license=("GPL")
url="https://pypi.python.org/pypi/Frozen-Flask"
depends=("python-flask")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("c348e0165b161efa44770157eba3e006cc6a1e9867bfd74670cbc56529cc5512")

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
