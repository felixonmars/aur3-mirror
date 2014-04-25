# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=tabulate
pkgname=python-$_pkgname
pkgver=0.7.2
pkgrel=1
pkgdesc="Pretty-print tabular data in Python."
arch=("any")
license=("MIT")
url="https://bitbucket.org/astanin/python-tabulate"
depends=("python")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("532ccab8d9e4659a5f016d84814df86cc04763785e9de2739e890d956dc82d8f")

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
