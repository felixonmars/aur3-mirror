#Contributor: KJoN <kurt_andereya@hotmail.com>
pkgname=madwifi-svn-hal
pkgver=0.10.5.6
pkgrel=2
pkgdesc="Multiband Atheros Drivers - hal 0.10.5.6"
arch=('i686' 'x86_64')
url="http://www.madwifi.org"
license=('GPL')
depends=('wireless_tools')
provides=('madwifi' 'madwifi-utils')
source=()
md5sums=()

_svntrunk=http://svn.madwifi.org/madwifi/branches/madwifi-hal-0.10.5.6

build() {
	cd $startdir/src
	svn co $_svntrunk $pkgname-$pkgver
	cd $startdir/src/$pkgname-$pkgver
	make
	make DESTDIR=$startdir/pkg install
	cp $startdir/pkg/usr/local/* $startdir/pkg/usr -vR
	cp $startdir/pkg/usr/share/* $startdir/pkg/usr -vR
	rm $startdir/pkg/usr/{local,share} -r
}
