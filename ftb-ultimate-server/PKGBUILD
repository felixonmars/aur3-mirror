# Maintainer: Justin Dray <justin@dray.be>

pkgname=ftb-ultimate-server
pkgver=1.1.2
pkgrel=2
pkgdesc="Feed the Beast Ultimate server unit files, script, and jar"
arch=('i686' 'x86_64')
url="http://www.feed-the-beast.com/"
license=('custom')
depends=('expect' 'java-runtime-headless' 'screen' 'unzip')
backup=("etc/conf.d/${pkgname/-server}")
replaces='feedthebeast-server'
options=(emptydirs)
install=install
source=(Ultimate_Server.zip::http://www.creeperrepo.net/direct/FTB2/2a5a4fac3b09c8d43b70a266aad2de3f/modpacks%5EUltimate%5E1_1_2%5EUltimate_Server.zip
        bin
        service
	config)
noextract=('Ultimate_Server.zip')
md5sums=('b2527df686714330ee8034115c9c06a6'
         '384658d8d5ef702392550f5c4e3596d9'
         '0fa22312c6db15802505b1244f6b8d6c'
         '7a128f94f60ea403d11e39f8ff14ee18')
PKGEXT='.pkg.tar.gz'

build() {
	cd "$srcdir"
	unzip -qo "Ultimate_Server.zip" -d "$srcdir/$pkgname"
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
