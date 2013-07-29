# Maintainer: Isaac C. Aronson <isaac at pingas dot org>

pkgname=feedthebeast-server
pkgver=1.2.6
pkgrel=1
pkgdesc="Feed the Beast server unit files, script, and jar"
arch=('i686' 'x86_64')
url="http://www.feed-the-beast.com/"
license=('custom')
depends=('java-runtime-headless' 'systemd' 'screen' 'expect')
options=(emptydirs)
install=feedthebeast-server.install
backup=('etc/conf.d/feedthebeast')
source=(Ultimate_Server.zip::http://www.creeperrepo.net/direct/FTB2/2a5a4fac3b09c8d43b70a266aad2de3f/modpacks%5EUltimate%5E1_1_2%5EUltimate_Server.zip
        feedthebeastd.bin
        feedthebeastd.service
	conf.feedthebeast)
noextract=("Ultimate_Server.zip")  
md5sums=('b2527df686714330ee8034115c9c06a6'
         '9031b79a2ba72dc52c5494e814095640'
         '9d05e8f3a8857283dfcc1d73420f08f0'
         'cb75cae242931e371ee28ee49486f17a')
PKGEXT='.pkg.tar.gz'

build() {
	cd "$srcdir"
	unzip -qo "Ultimate_Server.zip" -d "$srcdir/feedthebeastd"
}

package() {
	cd "$srcdir"

	install -Dm744 "$srcdir/feedthebeastd.bin" "$pkgdir/usr/bin/feedthebeastd"
	install -d "$pkgdir/srv/feedthebeastd"
	cp -r "$srcdir/feedthebeastd/"* "$pkgdir/srv/feedthebeastd/"
	install -Dm644 "$srcdir/feedthebeastd.service" "$pkgdir/usr/lib/systemd/system/feedthebeastd.service"
	install -Dm644 "$srcdir/conf.feedthebeast" "$pkgdir/etc/conf.d/feedthebeast"
}
