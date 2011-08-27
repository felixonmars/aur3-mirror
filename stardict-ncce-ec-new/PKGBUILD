# Maintainer: figo.zhang <figo1802@gmail.com>

pkgname=stardict-ncce-ec-new
pkgver=2.4.2
pkgrel=3
pkgdesc="English Chinese dictionary NCCE for Stardict"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('dff666d3a49a6c52342ac33bcee50938')
source=(http://debian.ustc.edu.cn/debian-uo/dists/sid/ustc/pool/stardict/stardict-ncce-ec_2.4.2-2_all.deb)    
arch=('any')

build() {
	cd $startdir/src/
      ar -xv stardict-ncce-ec_2.4.2-2_all.deb ;
      tar -xvf data.tar.gz
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/ncce-ec.dict.dz   $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/ncce-ec.idx       $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/ncce-ec.ifo       $startdir/pkg/usr/share/stardict/dic/
}
