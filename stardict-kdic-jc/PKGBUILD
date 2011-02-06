# Maintainer: firefoxmmx <firefoxmmx@gmail.com>

pkgname=stardict-kdic-jc
pkgver=2.4.2
pkgrel=1
pkgdesc="Japanese Chinese dictionary KDIC for Stardict(日汉词典 by 胡正)"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('662ded1aa8251875e7e6a2d43b0a6b9c')
source=(http://www.stardict.org/downloadit.php?file=$pkgname-$pkgver.tar.bz2)    
arch=('i686' 'x86_64')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	cp -r $pkgname-$pkgver $startdir/pkg/usr/share/stardict/dic/
}
