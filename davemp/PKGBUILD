# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=davemp
pkgver=1.23
pkgrel=3
pkgdesc="A lightweight, low-dependency web interface to MPD"
arch=('any')
url="http://www.ion0.com/davemp"
license=('CCPL' 'MIT')
depends=('mpd' 'perl' 'perl-http-server-simple' 'perl-json-xs' 'perl-class-accessor')
backup=('etc/conf.d/davempd'
        'etc/davemp.conf')
source=("http://www.ion0.com/davemp/downloads/files/$pkgname-$pkgver.tar.gz"
        'encode-json.patch'
        'davempd'
        'davempd.confd'
        'LICENSE')
md5sums=('bef1fe4ac565b716c8838cce79572a2e'
         '76a7b4b075be475ad850b67005e71c7c'
         '76c01b116eac25da6e58d4940c4ff18c'
         'a28dc6b07d046f2da943915882d8799a'
         '83f6e590f2116a7e411560ab543f8699')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p0 < "$srcdir/encode-json.patch"
	sed -i "s%\(use lib '\)\./lib\('\;\)%\1/usr/lib/$pkgname\2%" davempd.pl
	sed -i "s%\(themeroot = \)\./themes%\1/usr/share/$pkgname/themes%" davemp.conf
}

package()	{
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr"/{"share/$pkgname",lib}
	cp -R themes "$pkgdir/usr/share/$pkgname"
	cp -R lib "$pkgdir/usr/lib/$pkgname"

	install -Dm 755 davempd.pl "$pkgdir/usr/bin/davempd.pl"
	install -Dm 644 davemp.conf "$pkgdir/etc/davemp.conf"
	install -Dm 755 "$srcdir/davempd" "$pkgdir/etc/rc.d/davempd"
	install -Dm 644 "$srcdir/davempd.confd" "$pkgdir/etc/conf.d/davempd"
	install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
