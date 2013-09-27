# Maintainer: Jason Begley <jayray@digitalgoat.com>

pkgname=havp
pkgver=0.92a
pkgrel=2
pkgdesc="Http AnviVirus Proxy."
url='http://www.server-side.de/'
license="GPL"
depends=('clamav')
arch=('i686' 'x86_64')
backup=(etc/havp/havp.conf)
	source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz
                havp.service)
md5sums=('f9a37411116eceea579b9034c5fa8a69'
         '1bfe1224f4c3c3b87dadf7c21131d6b3')
	build() {
		cd $startdir/src/$pkgname-$pkgver
		./configure --prefix=/ --sbindir=/usr/bin \
	        make || return 1
		make DESTDIR=$startdir/pkg/havp install
		cd $startdir
                rm -r $startdir/src/$pkgname-$pkgver/etc/init.d
		#install -D -m755 $startdir/src/$pkgname-$pkgver/etc/init.d/$pkgname $startdir/pkg/etc/rc.d/$pkgname
		perl -pi -e  's/var\/run\/havp/run/' $startdir/pkg/etc/havp/havp.conf
                install -D -m644 ${srcdir}/havp.service ${pkgdir}/usr/lib/systemd/system/havp.service
		install=$pkgname.install
		}
							      
