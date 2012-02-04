# Maintainer: figo.zhang <figo1802@gmail.com>

pkgname=stardict-kdic-computer
pkgver=2.4.2
pkgrel=3
pkgdesc="computer for Stardict"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('c7b7c44b438ced4b35ef550f5f5bbce6')
source=(http://debian.ustc.edu.cn/debian-uo/dists/sid/ustc/pool/stardict/stardict-kdic-computer-gb_2.4.2-2_all.deb)    
arch=('any')

build() {
	cd $startdir/src/
      ar -xv stardict-kdic-computer-gb_2.4.2-2_all.deb ;
      tar -xvf data.tar.gz
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/kdic-computer-gb.dict.dz   $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/kdic-computer-gb.idx       $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/kdic-computer-gb.ifo       $startdir/pkg/usr/share/stardict/dic/
}
