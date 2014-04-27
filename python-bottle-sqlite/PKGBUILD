# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=bottle-sqlite
pkgname=python-$_pkgname
pkgver=0.1.2
pkgrel=1
pkgdesc="SQLite3 integration for Bottle"
arch=("any")
url="http://bottlepy.org/docs/dev/plugins/sqlite.html"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("3106d332270022dcec66102082906da47bcc62acd43a44c3deea9b398ef3eeab")

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
