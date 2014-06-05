pkgname=libnl-tiny
pkgver=1
pkgrel=2
pkgdesc="stripped down version of libnl"
arch=(i686 x86_64)
url="http://openwrt.org"
license=('GPL')
depends=()
makedepends=('subversion')
source=("libnl-tiny::svn://svn.openwrt.org/openwrt/trunk/package/libs/libnl-tiny")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname/src"
	make CFLAGS="-O2 -fPIC"
}

package() {
	cd "$srcdir/$pkgname"
	install -dm0755 $pkgdir/usr/include/libnl-tiny
	install -Dm0755 src/libnl-tiny.so $pkgdir/usr/lib/libnl-tiny.so
	install -Dm0644 files/libnl-tiny.pc $pkgdir/usr/lib/pkgconfig/libnl-tiny.pc
	cp -a src/include/* $pkgdir/usr/include/libnl-tiny/
}
