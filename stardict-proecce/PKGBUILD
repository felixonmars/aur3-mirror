# Maintainer: figo.zhang <figo1802@gmail.com>

pkgname=stardict-proecce
pkgver=2.4.2
pkgrel=3
pkgdesc="Ó¢ººººÓ¢×¨Òµ´Êµä"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('7fd2125f0e8917a2fe2e2649bc4d86bc')
source=(http://debian.ustc.edu.cn/debian-uo/dists/sid/ustc/pool/stardict/stardict-proecce_2.4.2-2_all.deb)    
arch=('any')

build() {
	cd $startdir/src/
      ar -xv stardict-proecce_2.4.2-2_all.deb ;
      tar -xvf data.tar.gz
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/ProECCE.dict.dz   $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/ProECCE.idx       $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/ProECCE.ifo       $startdir/pkg/usr/share/stardict/dic/
}
