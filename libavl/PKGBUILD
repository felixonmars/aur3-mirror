# Packager: itsbrad212 <linuxguy16@gmail.com>
pkgname=libavl
pkgver=1.4.0
pkgrel=1
pkgdesc="A balanced tree library that comes with full documentation" 
arch=('i686' 'x86_64')
url="http://www.stanford.edu/~blp/avl/" 
license="GPL" 
makedepends=('make')
source=(ftp://ftp.gnu.org/pub/gnu/avl/avl-$pkgver.tar.gz)
md5sums=('28f175eed15a6ca52f626cb04964ee12')

build() { 
	cd avl-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install
}

