# Maintainer: Justin Dray <justin@dray.be>

pkgname=ftb-unleashed-server
pkgver=1.1.7
pkgrel=2
pkgdesc="Feed the Beast Unleashed server unit files, script, and jar"
arch=('i686' 'x86_64')
url="http://www.feed-the-beast.com/"
license=('custom')
depends=('expect' 'java-runtime-headless' 'screen' 'unzip')
options=(emptydirs)
backup=("etc/conf.d/${pkgname/-server}")
install=install
source=(Unleashed_Server.zip::http://www.creeperrepo.net/direct/FTB2/18606e7928709218bd2a4386fb84ada9/modpacks%5EUnleashed%5E1_1_7%5EUnleashed-server.zip
        bin
        service
	config)
noextract=('Unleashed_Server.zip')
md5sums=('dc1d1badcbae224b2d0cfb347369725f'
         '9da97322791b396045830ca887ac42ea'
         '003b749899919d3da08901192bd9add8'
         'a812c534cc2223c536640d86c5d5cc4d')
PKGEXT='.pkg.tar.gz'

build() {
	cd "$srcdir"
	unzip -qo "Unleashed_Server.zip" -d "$srcdir/$pkgname"
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
