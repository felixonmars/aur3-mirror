pkgname=roguedetector
pkgver=29
pkgrel=1
pkgdesc="helps system administrators to detect rogue DHCP server entities"
arch=(i686 x86_64)
url="https://code.google.com/p/roguedetector/"
license=('GPL')
depends=('libconfig' 'libnet' 'libpcap' 'gcc-libs')
backup=('etc/rogue_detector.cfg')
source=("$pkgname::svn+http://roguedetector.googlecode.com/svn/trunk"
	"roguedetect.service")
md5sums=('SKIP'
         'bc423eefc12cd0a8c6615205fcca79c0')

prepare() {
	cd "$srcdir/$pkgname/RogueDetect"
	sed -i 's|long int duration|int duration|g' App.cpp
}

build() {
	cd "$srcdir/$pkgname/RogueDetect"
	make
}

package() {
	cd "$srcdir/$pkgname/RogueDetect"
	install -Dm0755 dist/Debug/GNU-Linux-*/roguedetect $pkgdir/usr/bin/roguedetect
	install -Dm0644 rogue_detector.cfg $pkgdir/etc/rogue_detector.cfg
	install -Dm0644 $srcdir/roguedetect.service $pkgdir/usr/lib/systemd/system/roguedetect.service
}
