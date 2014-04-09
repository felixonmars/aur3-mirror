# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=shovel
pkgver=0.3.0
pkgrel=1
pkgdesc="Rake, for Python"
arch=('any')
url="https://github.com/seomoz/shovel"
license=('MIT')
depends=('python')
source=("https://pypi.python.org/packages/source/s/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b38cae71370865aae6713e29466741958e0b7bbfb238a57b9ebcd2e455de4706')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 # --skip-build
}
