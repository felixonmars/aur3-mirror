# Contributor: Fabio 'Feanor' Falcinelli < fabio.falcinelli@gmail.com >
# Asus F3F patch: < stefano@inventati.org >
pkgname=i810switch
pkgver=0.6.5
pkgrel=9
pkgdesc="An utility for switching the LCD and external VGA displays on and off under Linux"
arch=('i686')
url="http://www16.plala.or.jp/mano-a-mano/i810switch.html"
license=('GPL')
depends=('glibc')
source=(http://www16.plala.or.jp/mano-a-mano/i810switch/$pkgname-$pkgver.tar.gz
	asus.patch)
md5sums=('5ca07aee624589bdce5761c796e5f9a8'
         '454ef5561eb1b9e97bb141f58c775f2e')

build() {
	cd $startdir/src/$pkgname-$pkgver
	patch -p0 < $startdir/asus.patch
	make || return 1
	make DESTDIR="$startdir/pkg" install
}


