# Maintainer: darkraid1 <darkraid1@gmail.com>

pkgname=hpl1-engine
pkgver=1.0
pkgrel=1
pkgdesc="The HPL1-engine librarys"
arch=(i686 x86_64)
license=('GPL3')
url="http://frictionalgames.com"
source=(http://blizzard11.bplaced.net/hpl1engine.tar.gz)
md5sums=('209871da16f3bdcafdba7ccf1ef29596')

build(){
	mkdir -p $pkgdir/usr/include
	cp -r $srcdir/* $pkgdir/usr/include/
}
