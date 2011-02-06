# Contributor: Rudy Matela <rudy.matela@gmail.com>
pkgname=mrt
pkgver="2.2.2a"
pkgrel=2
pkgdesc="A Multi-threaded Routing Toolkit. Includes routing daemons, programming libraries and measurement tools."
arch=('i686')
url="http://mrt.sourceforge.net/"
license=('BSD')
depends=('glibc')
makedepends=()
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('68d6e681b0c01599d02ab60a640463a0')

build() {
	cd "$startdir/src/$pkgname-2.2a-Aug-14-2000/src"
	./configure --prefix=/usr || return 1
	make || return 1
	mkdir -p $startdir/pkg/usr/bin
	mkdir -p $startdir/pkg/usr/man/man1
	cp programs/route_btoa/route_btoa $startdir/pkg/usr/bin
	cp programs/route_btoa/route_btoa.1 $startdir/pkg/usr/man/man1
	cp programs/route_atob/route_atob $startdir/pkg/usr/bin
	cp programs/route_atob/route_atob.1 $startdir/pkg/usr/man/man1
}
