# Maintainer: figo.zhang <figo1802@gmail.com>

pkgname=stardict-zhwikisource
pkgver=2006
pkgrel=2
pkgdesc="Wikipedia zhwikisource dictionary for Stardict"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('7cafb6e75e17cef34ac4db204970a609')
source=(http://debian.ustc.edu.cn/debian-uo/dists/sid/ustc/pool/stardict/stardict-wikipedia-zhwikisource-20061205_2.4.2-2_all.deb)    
arch=('any')

build() {
	cd $startdir/src/
      ar -xv stardict-wikipedia-zhwikisource-20061205_2.4.2-2_all.deb;
      tar -xvf data.tar.gz
	
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/wikipedia-zhwikisource-20061205.dict.dz   $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/wikipedia-zhwikisource-20061205.idx       $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/wikipedia-zhwikisource-20061205.ifo       $startdir/pkg/usr/share/stardict/dic/
}
