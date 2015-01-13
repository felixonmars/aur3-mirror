# Maintainer: Spider.007 <aur@spider007.net>

pkgname=graylog2-server
pkgver=0.92.3
pkgrel=1
pkgdesc="Graylog2 is an open source syslog implementation that stores your logs in ElasticSearch and MongoDB"
arch=(any)
url="http://graylog2.org/"
license=('GPL')
depends=(java-runtime elasticsearch mongodb)
install=graylog2-server.install
backup=(
	etc/graylog2.conf
)
source=(
	http://packages.graylog2.org/releases/$pkgname/$pkgname-$pkgver.tgz
	graylog2-tmpfiles.conf
	graylog2.service
)
sha256sums=('2f52f1eaa96f9001ac9ce059133a1d5be1d7d36a8573cf91d7028abba996db01'
            '28f7fbcc3b5d431c64c983c39714f6f925caac4bb8d4e1ef4dc99c4ba1979cfd'
            '2283d10a33ef4cdc859d04d19ed6ca5b1f6fd1ebce97d1adf6c6b192d7375e42')

package() {
	cd "$srcdir/$pkgname-${pkgver}"

	mkdir -p $pkgdir/usr/lib/graylog2/{spool,plugin}
	chown nobody: $pkgdir/usr/lib/graylog2/{spool,plugin}

	install -Dm644 graylog2-server.jar "$pkgdir/usr/lib/graylog2/server.jar"
	install -Dm644 "$srcdir/graylog2-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/graylog2-server.conf"
	install -Dm644 "$srcdir/graylog2.service" "$pkgdir/usr/lib/systemd/system/graylog2.service"

	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	cp README.markdown COPYING "$pkgdir/usr/share/doc/$pkgname"

	install -Dm644 graylog2.conf.example $pkgdir/etc/graylog2.conf
	sed -i 's/_dir = /_dir = \/usr\/lib\/graylog2\//g' $pkgdir/etc/graylog2.conf
}
