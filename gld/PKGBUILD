# Contributor: GnunuX <gnunux chez laposte point net>
pkgname=gld
pkgver="1.7"
pkgrel=1
pkgdesc="Gld is a standalone greylisting server for Postfix it listen on a TCP port and use MySQL for storing data."
url="http://www.gasmi.net/gld.html"
license="GPL"
depends=('postfix' 'mysql')
install=gld.install
source=(http://www.gasmi.net/down/$pkgname-$pkgver.tgz gld)
md5sums=('d24931630504e8586b9eb4cc3cc9d726' '8193f25ced9e5b0b4187338996cdf33e')

build() {
	cd $startdir/src/$pkgname-$pkgver/
	./configure
	sed -i 's@/etc/gld.conf@/etc/gld/gld.conf@g' gld.h 
	make || return 1
	mkdir -p $startdir/pkg/usr/bin/
	install -m755 gld $startdir/pkg/usr/bin/
	mkdir -p $startdir/pkg/etc/gld
	mkdir -p $startdir/pkg/etc/rc.d
	sed -i 's@nobody@postfix@g' gld.conf
	install -m600 gld.conf $startdir/pkg/etc/gld
	install -m644 tables.mysql $startdir/pkg/etc/gld
	install -m644 table-whitelist.sql $startdir/pkg/etc/gld
	install -m755 ../gld $startdir/pkg/etc/rc.d/
}

