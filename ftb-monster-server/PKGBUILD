# Maintainer: Justin Dray <justin@dray.be>

pkgname=ftb-monster-server
pkgver=1.1.1
pkgrel=2
pkgdesc="Feed the Beast Monster server. Spiritual successor to FTB Unleashed"
arch=('i686' 'x86_64')
url="http://www.feed-the-beast.com/"
license=('custom')
depends=('expect' 'java-runtime-headless' 'screen' 'unzip')
backup=("etc/conf.d/${pkgname/-server}")
options=(emptydirs)
install=install
source=("MonsterServer-$pkgver.zip::http://www.creeperrepo.net/FTB2/modpacks%5EMonster%5E1_1_1%5EMonsterServer.zip"
        'bin'
        'service'
	'config')
noextract=("MonsterServer-$pkgver.zip")
md5sums=('2213d027de597b2a6dba5687f56e972a'
         '6f85812683356e30649b19df3b58c994'
         '21381b0f1d3bf356568a2b578deb646d'
         'c460bf54eb513c293199e19c0f2c28de')
PKGEXT='.pkg.tar.gz'

build() {
	cd "$srcdir"
	unzip -qo "MonsterServer-$pkgver.zip" -d "$srcdir/$pkgname"
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
