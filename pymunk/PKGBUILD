# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Dan Serban
# Contributor: Fabio Volpe

pkgname=pymunk
pkgver=3.0.0
pkgrel=1
pkgdesc="A wrapper around the 2d physics library Chipmunk"
arch=(any)
url=http://code.google.com/p/pymunk/
license=MIT
depends=(python2 chipmunk)
source=("http://pymunk.googlecode.com/files/$pkgname-$pkgver.zip")

build() {
	cd $pkgname-$pkgver
	rm -rf build
	rm pymunk/*.{so,dll}
	python2 setup.py build
}

package() {
	cd $pkgname-$pkgver
	python2 setup.py install --root="$pkgdir"
	_site_packages=$(python2 -sSc 'import site; print site.getsitepackages()[0]')
	ln -s "/usr/lib/libchipmunk.so" "$pkgdir$_site_packages/$pkgname/libchipmunk64.so"
	ln -s "/usr/lib/libchipmunk.so" "$pkgdir$_site_packages/$pkgname/libchipmunk.so"
}

sha256sums=('effa4d2a9564914180c41c748e5ca91f84723c53696d310d763711c414a4a933')
