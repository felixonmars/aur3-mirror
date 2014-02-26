# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-docopt
pkgver=0.6.1
pkgrel=2
pkgdesc="Pythonic option parser, that will make you smile"
arch=(any)
url="https://github.com/docopt/docopt"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
source=("http://pypi.python.org/packages/source/d/docopt/docopt-$pkgver.tar.gz" LICENSE-MIT)

build() {
	cd "$srcdir/${pkgname/python2-}-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/${pkgname/python2-}-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
	install -Dm0644 "$srcdir/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('71ad940a773fbc23be6093e9476ad57b2ecec446946a28d30127501f3b29aa35'
            '3d5df78f592ff2433c3c6ce4984091b7f497059ddb8c6b08a061ba48e37b67f2')
