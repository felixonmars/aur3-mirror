# Maintainer: Luka Perkov <luka.perkov@sartura.hr>

pkgname=pyang
pkgver=1.5
pkgrel=1
pkgdesc='An extensible YANG validator and converter in python'
arch=(any)
url='https://code.google.com/p/pyang/'
license=('BSD')
depends=(python)
makedepends=(python-setuptools)
source=("https://drive.google.com/uc?export=download&id=0B7sFxp9f2Ez2allHaHZCekF3TVE&authuser=0")
md5sums=('14ed8164f493ac59afac4443ad8143ef')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	python setup.py install -O1 --root="$pkgdir"
}

# burp -c none `ls pyang*.src.tar.gz | sort | tail -n 1`
