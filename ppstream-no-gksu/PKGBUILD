# Contributor: yanganto <yanganto@gmail.com>

pkgname='ppstream-no-gksu'
pkgver='1.0.0'
pkgrel='1'
arch=('i686')
url='http://blog.jsdan.com/2765'
license=('unknown')
pkgdesc='PPStream without gksu for GNU/Linux'
optdepends=('gksu')
depends=('fuse' 'mplayer' 'qt')
source=('https://launchpad.net/~cnav/+archive/ppa/+files/ppstream_1.0.0-3_i386.deb')
md5sums=('80fe2fa6f86d2d99eeb75934ac21a198')
install=$pkgname.install
build(){
	ar x ppstream_1.0.0-3_i386.deb
	tar xf data.tar.gz -C ${pkgdir}
	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	echo '/opt/pps/lib' > ${pkgdir}/etc/ld.so.conf.d/pps.conf
}

package(){
	mkdir -p ${pkgdir}/usr/bin
	ln -s /opt/pps/bin/PPStream ${pkgdir}/usr/bin/ppstream
}
