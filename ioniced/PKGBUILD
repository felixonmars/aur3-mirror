# contributor: Jan Mette (funkyou) <spam-o-mat @ nickname.berlin.de>

pkgname=ioniced
pkgver=1.1
pkgrel=1
pkgdesc="I/O priority daemon"
arch=(i686 x86_64)
url="http://www.hauke-laging.de/software/ioniced/"
license="GPL"
depends=('perl' 'ionice')

install=ioniced.install
source=('ioniced.pl' 'ioniced.rc' 'iops.sh')

md5sums=('455ea67e274a5f7d0f424f05655cac01'
	 '8222a512d748fc41dec833da8a856aa0'
	 '35ddcaa9338fed47be8e920549bed0f2')

build() {
	
	# install daemon
	install -D -m755 -o root -g root $startdir/src/ioniced.rc $startdir/pkg/etc/rc.d/ioniced
	
	# install init script
	install -D -m755 -o root -g root $startdir/src/ioniced.pl $startdir/pkg/sbin/ioniced
	
	# install iops
	install -D -m755 -o root -g root $startdir/src/iops.sh $startdir/pkg/bin/iops
	
	}
