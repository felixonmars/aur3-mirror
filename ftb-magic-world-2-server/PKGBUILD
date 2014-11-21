# Maintainer: Justin Dray <justin@dray.be>

pkgname=ftb-magic-world-2-server
pkgver=1.1.2
pkgrel=1
pkgdesc="Feed the Beast Magic World 2 server. Spiritual successor to FTB Unleashed"
arch=('i686' 'x86_64')
url="http://www.feed-the-beast.com/"
license=('custom')
depends=('expect' 'java-runtime-headless' 'screen' 'unzip')
backup=("etc/conf.d/${pkgname/-server}")
options=(emptydirs)
install=install
	source=("MagicWorld2Server-$pkgver.zip::http://www.creeperrepo.net/FTB2/modpacks%5EMagic_World_2%5E1_1_2%5EMagicWorld2Server.zip"
        'bin'
        'service'
	'config')
noextract=("MagicWorld2Server-$pkgver.zip")
md5sums=('c3cdf2acce54194ec721a45bda919b4f'
         '0e5c412d669f31c3200e91fe6e09ac7e'
         '1e23f8c1ff71a0e7fa2c14cc069879d4'
         'e7f0eb45edd7dd2dd07372b48e3419db')
PKGEXT='.pkg.tar.gz'

build() {
	cd "$srcdir"
	unzip -qo "MagicWorld2Server-$pkgver.zip" -d "$srcdir/$pkgname"
}

package() {
	cd "$srcdir"
	
	install -d "$pkgdir/srv/$pkgname"
	cp -r "$srcdir/$pkgname/"* "$pkgdir/srv/$pkgname/"
	install -Dm744 "$srcdir/bin" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$srcdir/config" "$pkgdir/etc/conf.d/${pkgname/-server}"
	rm -f "$pkgdir"/srv/$pkgname/ServerStart.{bat,sh}
}
