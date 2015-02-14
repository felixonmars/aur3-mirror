# Contributor: danitool
pkgname=netdiscover-debian
pkgver=0.3beta7
pkgrel=3
pkgdesc="netdiscover from debian sources, updated version with extra options (like trunk flavour), new MAC database, and without several bugs"
arch=('i686' 'x86_64')
url="http://nixgeneration.com/~jaime/netdiscover/"
license=('GPL')
depends=('libnet' 'libpcap')
makedepends=('gcc' 'make' 'wget')
provides=('netdiscover')
conflicts=('netdiscover' 'netdiscover-svn' 'netdiscover-patched')
replaces=()
backup=()
groups=()
options=()
source=("http://ftp.debian.org/debian/pool/main/n/netdiscover/netdiscover_0.3beta6+20080409.orig.tar.gz"
	'update-oui-database.sh'
	'oui.txt')

md5sums=('cbbe3ae11d7f2e277a592e0a246f0731'
	'692947529068afb7bfa82b0ee3858ccb'
	'0cc86ec3f658d54d36e88a5dadc924a6')

build() {
	cd ${srcdir}/netdiscover
	./autogen.sh --sbindir=/usr/bin --prefix=/usr --sysconfdir=/etc/
	./configure --sbindir=/usr/bin --prefix=/usr --sysconfdir=/etc/
# the old update-oui-database.sh is broken, so I provided this updated one based on netdiscover trunk:
	cp ${startdir}/update-oui-database.sh .
	cp ${startdir}/oui.txt .
	chmod +x update-oui-database.sh
# let's fetch an updated MAC table:
	./update-oui-database.sh
	make || return 1
	}
	
package() {
	cd ${srcdir}/netdiscover
	make DESTDIR=${pkgdir} install || return 1
	rm -rf ${pkgdir}/usr/doc
}
