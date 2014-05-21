# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=liboop
pkgver=1.0
pkgrel=4
pkgdesc='A low-level event loop management library'
arch=('i686' 'x86_64')
url='http://www.lysator.liu.se/liboop/'
license=('LGPL')
depends=('adns')
source=('git://git.lysator.liu.se/liboop/liboop.git')
md5sums=('SKIP')

build() {
	cd liboop

	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd liboop
	make DESTDIR="$pkgdir" install
}
