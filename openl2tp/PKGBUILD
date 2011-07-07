# Maintainer: Aleksey Frolov <atommixz@gmail.com>
# Contributor: Orivej Desh <smpuj@bk.ru>

pkgname=openl2tp
pkgver=1.8
pkgrel=4
pkgdesc="L2TP client / server, written by Katalix Systems specifically for Linux"
arch=(i686 x86_64)
url="http://opensource.katalix.com/openl2tp"
license=("GPL")
depends=('rpcbind')
makedepends=('kernel26-headers')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz 
		rc.openl2tpd
		gcc-4.6.patch)
options=(!emptydirs)

build() {
	cd "$pkgname-$pkgver"
	
	sed -i -e 's|-Werror||' Makefile
	sed -i -e 's|source|build|' Makefile
	patch -p2 < ../../gcc-4.6.patch

	make 

	make \
		SYS_LIBDIR=/usr/lib \
		DESTDIR=${pkgdir} \
		install
	
	install -Dm755 ../rc.openl2tpd "$pkgdir"/etc/rc.d/openl2tpd
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

md5sums=('e3d08dedfb9e6a9a1e24f6766f6dadd0'
         '93527f9aebc03f9e05073115008989fa'
         '63e674724d0ae4265b86e776827969e1')
