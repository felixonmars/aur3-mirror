# Maintainer: Tino Reichardt <milky-archlinux@mcmilk.de>
pkgname=cddbd
pkgver=1.5.2
pkgrel=1
pkgdesc="The Internet CD Database Server"
url="http://www.freedb.org/"
license="GPL"
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://ftp4.de.freesbie.org/pub/misc/freedb/$pkgname-$pkgver.tar.gz cddbd.tar.bz2)
md5sums=('2f0e6a0ec6a4157a5c3874fca10b33ce' '2091e3f8286cb8ba46dda01c178c86ef')

build() {
        rm -rf $startdir/pkg
        cd $startdir/src/$pkgname-$pkgver
	bzcat $startdir/config.diff.bz2 | patch -p1
	CC='gcc -pipe -Os' make
	strip -R .note -R .comment cddbd
	mkdir -p $startdir/pkg/usr/sbin \
		$startdir/pkg/usr/man/man1 \
		$startdir/pkg/var \
		$startdir/pkg/etc/rc.d \
		$startdir/pkg/home/httpd/cgi-bin
	cp cddbd $startdir/pkg/usr/sbin
	cp cddbd.1 $startdir/pkg/usr/man/man1
	cp $startdir/cddbd $startdir/pkg/etc/rc.d
	cd $startdir/pkg/var || exit 1
	cp -r $startdir/src/cddbd $startdir/pkg/var
	chown -R nobody.root .
	cd $startdir/pkg/home/httpd/cgi-bin
	ln -s /usr/sbin/cddbd cddb.cgi
}
