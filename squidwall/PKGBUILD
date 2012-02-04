# Maintainer: Tino Reichardt <milky-archlinux@mcmilk.de>
pkgname=squidwall
pkgver=0.4d
pkgrel=1
pkgdesc="A fast, small and secure squid redirector with url/content filtering and antivirus scanning."
license="GPL"
depends=('apache' 'squid' 'php')
makedepends=('dietlibc')
conflicts=()
replaces=()
backup=(usr/bin/squidwall.sh)
install=install
url="http://www.mcmilk.de/projects/squidwall/"
source=(http://www.mcmilk.de/projects/squidwall/dl/$pkgname-$pkgver.tar.bz2 \
        http://www.mcmilk.de/projects/squidwall/dl/webinterface/0.4/2006-08-30.tar.bz2 \
        http://dl.fefe.de/libowfat-0.24.tar.bz2
	squid.conf squidwall.logrotate)
md5sums=('9474d442eaba0721509f755be83caaac' '0c5ae0a1347513cd8af81865e9f1061b'\
         'a38b74998a45fd6c47e93e0fec1f6560' '0eae1dbb2153c03e9e2c4c543f12abfc'\
         '086f8bc255a71ca7a70ea1dce7dd4f1c')

build() {
	rm -rf $startdir/pkg
	cd $startdir/src
	ln -f -s libowfat-0.24 libowfat

	# compile libowfat
	cd $startdir/src/libowfat
	make || return 1

	# compile squidwall
	cd $startdir/src/$pkgname-$pkgver
	make DIET='/opt/diet/bin/diet' || return 1
	mkdir -p $startdir/pkg

	# create directories for the package
	cd $startdir/pkg
	mkdir -p usr/bin home/httpd/html etc/squid etc/logrotate.d

	# copy misc files
	cd $startdir/src/$pkgname-$pkgver
	cp squidwall $startdir/pkg/usr/bin
	cp contrib/squidwall.sh $startdir/pkg/usr/bin
	cp $startdir/squidwall.logrotate $startdir/pkg/etc/logrotate.d/squidwall
	cp $startdir/squid.conf $startdir/pkg/etc/squid/squid.conf.squidwall

	# move the webinterface to /etc
	cd $startdir/src
	mv squidwall $startdir/pkg/etc
	cd $startdir/pkg/etc/squidwall
	mv inet $startdir/pkg/home/httpd/html

	# rw support for webusers, 'nobody' is the arch default
	cd $startdir/pkg
	chown -R nobody.nobody home/httpd/html
	chown -R nobody.nobody etc/squidwall
	rm -f etc/squidwall/users/\?*
	rm -f etc/squidwall/hosts/\?*
}
