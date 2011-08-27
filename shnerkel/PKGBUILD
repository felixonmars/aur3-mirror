# Maintainer: timttmy <marshall\\dot//cleave\\at//tiscali\\dot//co\\dot//uk>

pkgname=shnerkel
pkgver=0.04
pkgrel=2
pkgdesc="A Linux Outlaws podcast aggregator and player"
url="http://www.jezra.net/projects/shnerkel"
depends=('gstreamer0.10' 'gtk2' 'libwebkit' 'libxml2')
makedepends=('vala')
license="GPL"
source=(http://launchpad.net/$pkgname/stable/$pkgver/+download/$pkgname-$pkgver.tar.gz $pkgname.desktop )
md5sums=('db580cadfba8a8c405df1c4846ce66d0' 'c0f01c1e4ea5caa2b654ee4e8151e82f')
arch=('i686' 'x86_64')

build() {
	mkdir -p "$pkgdir/usr/share/pixmaps/" || return 1
	install -m 644 $startdir/src/shnerkel-0.04/data/icons/shnerkel.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 $startdir/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr/
	make || return 1
	make DESTDIR=$pkgdir install
}
