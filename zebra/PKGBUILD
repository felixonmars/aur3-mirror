# Maintainer: Jason Begley <jayray@digitalgoat.com>

pkgname=zebra
pkgver=0.95a
pkgrel=1
pkgdesc="GNU Zebra free routing software"
url='http://www.zebra.org/'
license="GPL"
arch=('i686')
depends=()
backup=('etc/zebra.conf' 'etc/ospfd.conf' 'etc/bgpd.conf' 'etc/ripd.conf')
	source=(ftp://ftp.zebra.org/pub/zebra/$pkgname-$pkgver.tar.gz)
	md5sums=('9b8fec2d4f910334e50167414fcf193b')

	build() {
		cd $startdir/src/$pkgname-$pkgver
		./configure --sysconfdir=/etc --prefix=/usr/  
	        make || return 1
		make DESTDIR=$startdir/pkg install
		mv $startdir/pkg/etc/bgpd.conf.sample $startdir/pkg/etc/bgpd.conf
		mv $startdir/pkg/etc/ospfd.conf.sample $startdir/pkg/etc/ospfd.conf
		mv $startdir/pkg/etc/ripd.conf.sample $startdir/pkg/etc/ripd.conf
		mv $startdir/pkg/etc/zebra.conf.sample $startdir/pkg/etc/zebra.conf
		install=$pkgname.install 
		}
							      
