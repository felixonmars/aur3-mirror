# Maintainer: firefoxmmx <firefoxmmx@gmail.com>

pkgname=stardict-dreye-jc
pkgver=2.4.2
pkgrel=1
pkgdesc="Japanese Chinese dictionary DrEye for Stardict(简明日汉词典 by 胡正)"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('b8a4a33d9d7aff4c1d9a1d5bc0c5c293')
source=(http://www.stardict.org/downloadit.php?file=stardict-DrEye-jc-$pkgver.tar.bz2)    
arch=('i686' 'x86_64')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	cp -r stardict-DrEye-jc-$pkgver $startdir/pkg/usr/share/stardict/dic/
}
