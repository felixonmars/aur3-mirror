pkgname=teamspeakctrl
pkgver=0.5
pkgrel=1
pkgdesc="A script to send keyboard input directly to ts2 even when it is not in focus."
arch=(i686 x86_64)
url="http://np1.pp.fi/ventriloctrl/"
license=('unknown')
source=(http://www.calebgray.com/uploads/ventriloctrl/ventriloctrl-0.5.zip)
md5sums=('09e819e982804df66d4c46558d922b98')
makedepends=('unzip')

build() {
	cd $startdir/src/ventriloctrl-$pkgver
	patch -p1 -i $startdir/teamspeak.patch || return 1
	make || return 1
	install -d $startdir/pkg/usr/bin/
	cp ventriloctrl $startdir/pkg/usr/bin/teamspeakctrl
}
