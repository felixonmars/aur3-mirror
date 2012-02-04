# Maintainer: figo.zhang <figo1802@gmail.com>

pkgname=stardict-ecmc
pkgver=2.4.2
pkgrel=3
pkgdesc="ECMC chinese to en for Stardict"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('714a51b631efff79625c291881095c86')
source=(http://debian.ustc.edu.cn/debian-uo/dists/sid/ustc/pool/stardict/stardict-powerword2007-pwdecmc_2.4.2-2_all.deb)    
arch=('any')

build() {
	cd $startdir/src/
      ar -xv stardict-powerword2007-pwdecmc_2.4.2-2_all.deb ;
      tar -xvf data.tar.gz
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/powerword2007_pwdecmc.dict.dz   $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/powerword2007_pwdecmc.idx       $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/powerword2007_pwdecmc.ifo       $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/powerword2007_pwdecmc.syn       $startdir/pkg/usr/share/stardict/dic/
}
