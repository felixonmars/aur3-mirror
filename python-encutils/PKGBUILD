# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-encutils
pkgver=0.9
pkgrel=1
pkgdesc="Encoding detection collection for Python."
url="http://cthedot.de/encutils/"
license=(LGPL3 CCPL)
depends=('python2')
arch=('any')
source=(http://pypi.python.org/packages/source/e/encutils/encutils-$pkgver.zip)
md5sums=('d6b01d11bf0897e50e11d6f95b8d9b81')

build() {
	cd $srcdir/encutils-$pkgver
	python2 setup.py install --root=$pkgdir
}

