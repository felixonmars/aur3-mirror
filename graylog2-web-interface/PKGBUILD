# Maintainer: Spider.007 <aur@spider007.net>
# Don't forget updating the version @ *.service
pkgname=graylog2-web-interface
pkgver=0.92.3
pkgrel=1
pkgdesc="Web interface for Graylog2, an open source syslog implementation"
arch=(any)
url="http://graylog2.org"
license=('GPL')
depends=(java-runtime)
source=(
	http://packages.graylog2.org/releases/$pkgname/$pkgname-$pkgver.tgz
	graylog2-web-interface.service
	graylog2-web-interface.conf
)
backup=(etc/webapps/$pkgname/$pkgname.conf)
options=(!strip)
sha256sums=('332412effce93dbec24059c2e1269b86a6c859e52ea71041b86bc848ce75f8ef'
            '3e8e32686655b6ab08fdd116d60ced7acf703ebe0b86f811e025d78b1ffba51f'
            'aa27f060410ffd47a675e95a1caaf37689a2b8201fb252d7c1d3b5096384be0c')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# verify classpath in service file
	lib=.$(grep ExecStart= $srcdir/graylog2-web-interface.service |cut -d' ' -f7|cut -d: -f1|cut -d\} -f2-)
	[[ ! -f $lib ]] && { echo "Incorrect classpath '$lib' in .service file" >&2; exit 2 ; }

	install -Dm644 "$srcdir/graylog2-web-interface.conf" "$pkgdir/etc/conf.d/graylog2-web-interface.conf"
	install -Dm644 "$srcdir/graylog2-web-interface.service" "$pkgdir/usr/lib/systemd/system/graylog2-web-interface.service"

	install -dm755 -o nobody "$pkgdir/etc/webapps/$pkgname/logs"
	cp conf/* "$pkgdir/etc/webapps/$pkgname/"

	install -dm755 "$pkgdir/usr/share/webapps/$pkgname"
	cp -R lib/ "$pkgdir/usr/share/webapps/$pkgname/"
	ln -s /etc/webapps/$pkgname/ $pkgdir/usr/share/webapps/$pkgname/conf
}
