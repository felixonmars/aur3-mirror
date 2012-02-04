# Maintainer: Julien Humbert <julroy67 at gmail dot com>

pkgname=tegaki-train
pkgver=0.3.1
pkgrel=2
pkgdesc="Character editor and training manager for Tegaki"
arch=('i686' 'x86_64')
url="http://www.tegaki.org/"
license=('GPL2')
depends=('tegaki-pygtk>=0.2')
makedepends=('python2')
source=("http://www.tegaki.org/releases/0.3.1/$pkgname-$pkgver.tar.gz")
md5sums=('36a4a482c6660885da6dfe82322a31c1')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	
	python2 setup.py build || return 1
	python2 setup.py install --prefix=$pkgdir/usr || return 1
}
