# Maintainer: figo.zhang <figo1802@gmail.com>

pkgname=stardict-enwikisource
pkgver=2006
pkgrel=2
pkgdesc="En Wikipedia dictionary for Stardict"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('b1d35b913abb9ffad3900ebe2aa4f361')
source=(http://debian.ustc.edu.cn/debian-uo/dists/sid/ustc/pool/stardict/stardict-wikipedia-enwikisource-20061130_2.4.2-2_all.deb)    
arch=('any')

build() {
	cd $startdir/src/
      ar -xv stardict-wikipedia-enwikisource-20061130_2.4.2-2_all.deb;
      tar -xvf data.tar.gz
	
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/wikipedia-enwikisource-20061130.dict.dz   $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/wikipedia-enwikisource-20061130.idx       $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/wikipedia-enwikisource-20061130.ifo       $startdir/pkg/usr/share/stardict/dic/
}
