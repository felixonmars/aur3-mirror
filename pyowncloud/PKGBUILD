#Contributor: Bjoern Franke <bjo at nord-west.org>

pkgname=pyowncloud
pkgver=0.3
pkgrel=2
pkgdesc="ownCloud CLI client written in python"
arch=(any)
url="https://github.com/csawyerYumaed/pyOwnCloud"
license=('GPL')
depends=('python2' 'ocsync')
makedepends=('python2-setuptools')
source=('https://github.com/csawyerYumaed/pyOwnCloud/archive/v0.3.tar.gz')
md5sums=('d2f85066217184b24bae34dc56b73116')

build() {
	cd "$srcdir/pyOwnCloud-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/pyOwnCloud-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir" --prefix=/usr
	
}

