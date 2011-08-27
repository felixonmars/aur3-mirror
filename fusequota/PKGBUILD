# Maintainer: Stanislav GE <ginermail@gmail.com>

pkgname=fusequota
pkgver=0.2
pkgrel=1
pkgdesc="A transparent file system layer for FUSE that enforces quotas on files and directories"
arch=(i686 x86_64)
url=http://code.google.com/p/fusequota/
license=(GPL3)
depends=(fuse)
source=(http://fusequota.googlecode.com/files/fusequota-0.2.tar.gz)
md5sums=('1fb93705ba84847d830836ad17cdfe1d')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make
	make DESTDIR=$pkgdir install
}
