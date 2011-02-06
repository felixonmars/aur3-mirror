# Maintainer: firefoxmmx <firefoxmmx@gmail.com>

pkgname=stardict-dreye-cj
pkgver=2.4.2
pkgrel=1
pkgdesc="Chinese Japanese dictionary DrEye for Stardict(简明汉日词典 by 胡正)"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('e878b1eb3c403356765e62a4a6d31bc1')
source=(http://www.stardict.org/downloadit.php?file=stardict-DrEye-cj-$pkgver.tar.bz2)    
arch=('i686' 'x86_64')

build() {
	cd $startdir/src/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	cp -r stardict-DrEye-cj-$pkgver $startdir/pkg/usr/share/stardict/dic/
}
