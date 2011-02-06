# Contributor: bountykiller <masse.nicolas@gmail.com>
pkgname=libcwd
pkgver=1.0.3
pkgrel=1
pkgdesc="Libcwd is a thread-safe, full-featured debugging support library for C++ developers"
arch=(i686 x86_64)
url="http://libcwd.sourceforge.net/"
license=('QPL')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('692ce375f5c91f9129dd3dbce10e2242')
build () {
	cd $startdir/src/$pkgname-$pkgver/
	./configure --prefix=/usr
	make
	make DESTDIR=$startdir/pkg install
}

