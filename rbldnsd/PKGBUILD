# Contributor: Dale Blount <dale@archlinux.org>
pkgname=rbldnsd
pkgver=0.997a
pkgrel=2
pkgdesc="Small and fast DNS daemon which is especially made to serve DNSBL zones"
arch=(i686 x86_64)
url="http://www.corpit.ru/mjt/rbldnsd.html"
license=('GPL')
depends=('zlib')
backup=('etc/conf.d/rbldnsd')
install=$pkgname.install
source=(http://www.corpit.ru/mjt/$pkgname/${pkgname}-${pkgver}.tar.gz rbldnsd.service conf.rbldnsd)
md5sums=('6d53caa511e003ff31391c6e6a63d2b0' '3a95757ca83db2096bd225207dd12cf5' \
         '8fc8131d235a938a1e8024ab85dc93ea')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure || return 1
	make || return 1
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
	install -d $pkgdir/var/lib/rbldns/logs
	chown 59:59 $startdir/pkg/rbldnsd/var/lib/rbldns || return 1
	chown 58:58 $startdir/pkg/rbldnsd/var/lib/rbldns/logs || return 1
	chmod 0711 -R $startdir/pkg/rbldnsd/var/lib/rbldns

	install -D -m 0755 rbldnsd $pkgdir/usr/bin/rbldnsd || return 1
	install -D -m 0644 rbldnsd.8 $pkgdir/usr/share/man/man8/rbldnsd.8 || return 1
	install -D -m 0644 $srcdir/conf.rbldnsd $pkgdir/etc/conf.d/rbldnsd || return 1
	install -D -m 0755 $srcdir/rbldnsd.service $pkgdir/usr/lib/systemd/system/rbldnsd.service || return 1
}
