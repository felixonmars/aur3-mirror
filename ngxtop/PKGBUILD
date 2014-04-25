# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=ngxtop
pkgver=0.0.2
pkgrel=1
pkgdesc="Real-time metrics for nginx server"
arch=("any")
url="https://pypi.python.org/pypi/ngxtop"
license=("MIT")
depends=("python-docopt" "python-pyparsing" "python-tabulate")
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz") #
sha256sums=("33c029075bc9a7f37c48564557218f9c0579d49c14bc01d51ab418deaa34181b")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
