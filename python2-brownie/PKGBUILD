# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=Brownie
pkgname=python2-${_pkgname,,}
pkgver=0.5.1
pkgrel=1
pkgdesc="Python Utility Library from Pocoo"
arch=("any")
url="https://pythonhosted.org/Brownie/"
license=("ISC")
depends=("python2")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("07f7d594feedf3d3dca160fd0bd1156e5077ef6ddb64ac759eebf1c56f83ce37")

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
