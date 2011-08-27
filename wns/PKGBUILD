# Contributor: Peque & MasiX (udbytossen@gmail.com)
pkgname=wns
pkgver=0.1
pkgrel=1
pkgdesc="Wifi networkscanner and profile handler"
depends=('wireless_tools')
license="GPL"
url="http://www.archlinux.dk/wns.htm"
install="wns.install"
source=('wnsd' 'wns')
md5sums=('1fe307e674c994c67f056676025797b6' '0d59b7d5aebaaf3ec6c951cd2682a503')

build () {
	mkdir -p $startdir/pkg/etc/rc.d/
	mkdir -p $startdir/pkg/usr/sbin/
	cp $startdir/src/wnsd $startdir/pkg/etc/rc.d/
	cp $startdir/src/wns $startdir/pkg/usr/sbin/
	chown root $startdir/pkg/etc/rc.d/wnsd
	chmod 755 $startdir/pkg/etc/rc.d/wnsd
	chown root $startdir/pkg/usr/sbin/wns
	chmod 755 $startdir/pkg/usr/sbin/wns
}
