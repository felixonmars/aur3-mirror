# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=python2-supernova
pkgver=0.9.0
pkgrel=3
pkgdesc="Wrapper for multiple nova environments"
arch=('any')
url="http://pypi.python.org/pypi/supernova"
license=('GPL')
depends=('python2-novaclient' 'python2-keyring')
makedepends=('python2-setuptools')
provides=("$pkgname=$pkgver")
source=(http://pypi.python.org/packages/source/s/supernova/supernova-${pkgver}.tar.gz)
md5sums=('83506cb0d4237c7adf6c556339739bd5')

build() {
	cd "$srcdir/supernova-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/supernova-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
