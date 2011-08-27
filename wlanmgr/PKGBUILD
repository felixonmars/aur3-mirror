# Contributor: Lexion <lexion@archlinux.us>
pkgname=wlanmgr
pkgver=0.1
pkgrel=1
pkgdesc="Wlanmgr is a set of utils for using and/or hacking wireless networks"
arch=('i686' 'x86_64')
url="http://onebluecat.net/wlanmgr"
license=('GPL')
install=wlanmgr.install
depends=('netcfg' 'dsniff' 'iftop' 'nmap')
optdepends=()
makedepends=()
provides=('wlanmgr')
conflicts=('wlanmgr')
source=()
md5sums=()

build() {
	wget $url/wlanmgr -O $srcdir/wlanmgr
	wget $url/wlanmgrrc.default -O $srcdir/wlanmgrrc.default

	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/etc
	install -m 755 $srcdir/wlanmgr $pkgdir/usr/bin/wlanmgr
	chmod +x $pkgdir/usr/bin/wlanmgr
	cp $srcdir/wlanmgrrc.default $pkgdir/etc/wlanmgrrc.example
}
