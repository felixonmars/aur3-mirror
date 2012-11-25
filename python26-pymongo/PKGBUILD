# Contributor: Devaev Maxim <mdevaev@gmail.com>

pkgname='python26-pymongo'
pkgver=2.3
pkgrel=1
pkgdesc='Python driver for MongoDB'
arch=('x86_64' 'i686')
license=('APACHE')
url='http://pypi.python.org/pypi/pymongo/'
depends=('python26')
makedepends=('python26-distribute')
source=("http://pypi.python.org/packages/source/p/pymongo/pymongo-$pkgver.tar.gz")
sha256sums=('8e43fdd7ea8e2aa965791af1b6e24186248023c6fde70092d9631b1d9150b1dc')

build() {
	cd $srcdir/pymongo-$pkgver
	python2.6 setup.py install --root=$pkgdir --optimize=1
}

