# Maintainer: firefoxmmx <firefoxmmx@gmail.com>

pkgname=stardict-kdic-cj
pkgver=2.4.2
pkgrel=1
pkgdesc="Chinese Japanese dictionary KDIC for Stardict(汉日词典 by 胡正)"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('4dcd426f118d029fccc7bd4c307467be')
source=(http://www.stardict.org/downloadit.php?file=$pkgname-$pkgver.tar.bz2)    
arch=('i686' 'x86_64')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	cp -r $pkgname-$pkgver $startdir/pkg/usr/share/stardict/dic/
}
