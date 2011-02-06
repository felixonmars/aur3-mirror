# Contributor: Ivan N. Veselov <veselov@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# $Id: PKGBUILD,v 1.1 2010/12/31 06:53:39 andres Exp $

pkgname=parprouted
pkgver=0.7
pkgrel=5
pkgdesc="proxy ARP IP bridging daemon"
arch=('i686' 'x86_64')
url="http://hazardous-area.org/parprouted/"
license=('GPL2')
depends=('iproute')
source=("http://hazardous-area.org/parprouted/parprouted-$pkgver.tar.gz"
	"000-routecmd.diff")
md5sums=('570f5deaf09600df8f80f589de79ecdb'
         'fdcd0f557abefc29b3eae934a7fe40cc')

build() {
	cd parprouted-$pkgver
	patch -p1 < ../000-routecmd.diff
	make CFLAGS+=' -DROUTE_CMD=\"/usr/sbin/ip\"'
}

package() {
	cd parprouted-$pkgver
	install -Dm755 parprouted $pkgdir/usr/sbin/parprouted
	install -Dm644 parprouted.8 $pkgdir/usr/share/man/man8/parprouted.8
}
