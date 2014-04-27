# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=python-termstyle
pkgver=0.1.10
pkgrel=1
pkgdesc="A dirt-simple terminal-colour library for python"
arch=("any")
url="https://pypi.python.org/pypi/python-termstyle/"
license=("BSD")
depends=("python")
source=("http://gfxmonk.net/dist/0install/impl/$pkgname/$pkgname-$pkgver.tgz")
sha256sums=("6faf42ba42f2826c38cf70dacb3ac51f248a418e48afc0e36593df11cf3ab1d2")

build() {
	cd "$srcdir"
	python setup.py build
}

package() {
	cd "$srcdir"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
