# Maintainer: Julien Humbert <julroy67 at gmail dot com>

pkgname=tegaki-tools
pkgver=0.3.1
pkgrel=3
pkgdesc="Advanced-user and developer tools for Tegaki"
arch=('any')
url="http://www.tegaki.org/"
license=('GPL2')
depends=('tegaki-python>=0.3' 'tegaki-pygtk>=0.3')
makedepends=('python2')
source=("http://www.tegaki.org/releases/0.3.1/$pkgname-$pkgver.tar.gz")
md5sums=('207237f2599f7d783fba0dfedffaa0aa')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --prefix=$pkgdir/usr --optimize=1
}

