# Contributor: wooptoo <wooptoo@gmail.com>

pkgname=coda
pkgver=6.9.5
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A distributed filesystem that allows disconnected operation"
url="http://www.coda.cs.cmu.edu/"
options=(!libtool)
license=('GPL')
depends=(lwp rpc2 rvm)
makedepends=(lwp rpc2 rvm)
source=(http://www.coda.cs.cmu.edu/pub/$pkgname/src/$pkgname-$pkgver.tar.gz
		venus)
md5sums=(23e3cbed0eea41aa9a9dea45df31938b
		83f7c920af109ff94e374004c6d0d350)

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install

	cd $startdir/pkg
	mkdir coda
	touch coda/NOT_REALLY_CODA

	mkdir -p usr/coda/etc
	mkdir -p usr/coda/venus.cache

	mkdir -p etc/rc.d
	install -m 755 $startdir/venus $startdir/pkg/etc/rc.d/venus
}
