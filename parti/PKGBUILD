# Contributor: Sacro <ben@benwoodward.me.uk>
pkgname=parti
pkgver=0.0.3
pkgrel=1
pkgdesc="A window manager library, a window manager, and a 'screen for X' utility"
arch=(i686 x86_64)
url="http://partiwm.org/wiki/xpra"
license=(UNKNOWN)
depends=(python libxtst gtk2 cairo)
makedepends=()
source=(http://partiwm.org/static/downloads/$pkgname-all-$pkgver.tar.gz)
md5sums=('0c2eef4c13d6507dd5389f63527964b0')

build() {
	cd $startdir/src/$pkgname-all-$pkgver
	./do-build
	mkdir -p $startdir/pkg/usr/
	cp -R install/* $startdir/pkg/usr
	chmod +x $startdir/pkg/usr/bin/*
	mkdir -p $startdir/pkg/usr/lib/python2.5
	mv $startdir/pkg/usr/lib/python $startdir/pkg/usr/lib/python2.5/site-packages/
}
