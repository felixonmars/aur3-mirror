# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>

pkgname=rootcheck
pkgver=2.4
pkgrel=2
pkgdesc="an open source rootkit detection and system auditing software"
arch=(i686 x86_64)
url="http://www.ossec.net/main/rootcheck"
license=("GPL")
source=(http://www.ossec.net/rootcheck/files/rootcheck-$pkgver.tar.gz)
md5sums=('d7c1afc8026a6a073147e322058ea6bd')

package() {
	cd $srcdir/$pkgname-$pkgver
	sed -i 's|./rootcheck.conf|/etc/rootcheck.conf|' src/rootcheck/rootcheck.c
	make all
	sed -i 's|./db/|/usr/share/rootcheck/db/|' rootcheck.conf
	mkdir -p $pkgdir/{etc,usr/share/rootcheck,usr/bin}
	install -m 755 ossec-rootcheck $pkgdir/usr/bin
	install -m 644 rootcheck.conf $pkgdir/etc
	cp -a db $pkgdir/usr/share/rootcheck
}

