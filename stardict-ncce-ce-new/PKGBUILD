# Maintainer: figo.zhang <figo1802@gmail.com>

pkgname=stardict-ncce-ce-new
pkgver=2.4.2
pkgrel=3
pkgdesc="Chinese English dictionary NCCE for Stardict"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('37e1c761092132aefc5e68257a88261f')
source=(http://debian.ustc.edu.cn/debian-uo/dists/sid/ustc/pool/stardict/stardict-ncce-ce_2.4.2-2_all.deb)    
arch=('any')

build() {
	cd $startdir/src/
      ar -xv stardict-ncce-ce_2.4.2-2_all.deb ;
      tar -xvf data.tar.gz
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/ncce-ce.dict.dz   $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/ncce-ce.idx       $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/ncce-ce.ifo       $startdir/pkg/usr/share/stardict/dic/
}
