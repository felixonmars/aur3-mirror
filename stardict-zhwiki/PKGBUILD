# Maintainer: figo.zhang <figo1802@gmail.com>

pkgname=stardict-zhwiki
pkgver=2.4.2
pkgrel=2
pkgdesc="Wikipedia dictionary for Stardict"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('6964a35085832aa2427dac25c1421a30')
source=(http://debian.ustc.edu.cn/debian-uo/dists/sid/ustc/pool/stardict/stardict-wikipedia-zhwiki-20061208_2.4.2-2_all.deb)    
arch=('any')

build() {
	cd $startdir/src/
      ar -xv stardict-wikipedia-zhwiki-20061208_2.4.2-2_all.deb;
      tar -xvf data.tar.gz
	
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/wikipedia-zhwiki-20061208.dict.dz   $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/wikipedia-zhwiki-20061208.idx       $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/wikipedia-zhwiki-20061208.ifo       $startdir/pkg/usr/share/stardict/dic/
}
