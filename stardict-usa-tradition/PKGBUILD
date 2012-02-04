# Maintainer: figo.zhang <figo1802@gmail.com>

pkgname=stardict-usa-tradition
pkgver=2.4.2
pkgrel=3
pkgdesc="USA traditional for Stardict (美国传统词典[双解])"
license=('GPL')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('02f8d895855e7a130ff03c7d7e637b7d')
source=(http://debian.ustc.edu.cn/debian-uo/dists/sid/ustc/pool/stardict/stardict-powerword-pwdecahd_2.4.2-2_all.deb)    
arch=('any')

build() {
	cd $startdir/src/
      ar -xv stardict-powerword-pwdecahd_2.4.2-2_all.deb ;
      tar -xvf data.tar.gz
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/powerword_pwdecahd.dict.dz   $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/powerword_pwdecahd.idx       $startdir/pkg/usr/share/stardict/dic/
	install -m 644 $startdir/src/usr/share/stardict/dic/powerword_pwdecahd.ifo       $startdir/pkg/usr/share/stardict/dic/
      install -m 644 $startdir/src/usr/share/stardict/dic/powerword_pwdecahd.syn      $startdir/pkg/usr/share/stardict/dic/
}
