# Maintainer: Julien Humbert <julroy67 at gmail dot com>

pkgname=tegaki-wagomu
pkgver=0.3.1.2
pkgrel=4
pkgdesc="Recognition engine for Tegaki"
arch=('i686' 'x86_64')
url="http://www.tegaki.org/"
license=('GPL2')
depends=('tegaki-python>=0.3' 'glib2')
makedepends=('python2' 'swig')
#source=("http://www.tegaki.org/releases/0.3.1/$pkgname-$pkgver.tar.gz")
source=("http://julroy67.free.fr/DL/$pkgname-$pkgver.tar.gz")
#md5sums=('19bba5c53210b808a93582f84fe4a676')
md5sums=('2e9937498b17f9d6369556d2ae280a0d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --prefix=$pkgdir/usr --optimize=1
}

