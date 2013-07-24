# Author : Oliver Seuffert
# Maintainer : Xi0N <grayfox.i0n@gmail.com>

pkgname=xbslink
pkgver=0.9.6.0
pkgrel=1
pkgdesc="XBSlink is a Proxy for Xbox360 & PS3/2 System Link Games."
arch=('any')
url="http://www.secudb.de/~seuffert/xbslink/"
depends=('mono>=2.4' 'libpcap' 'sudo')
license=('GPL')
install=xbslink.install
source=("http://www.secudb.de/~seuffert/xbslink/downloads/62"
	"xbslink.desktop"
	"xbslink.ico"
	"su-to-xbslink.sh")
md5sums=('e26c9d9bb21472b6d9d241bf8dc8aada'
	'6273c07612b290d0eeca1030df76da33'
	'38e9132992490d7b3d1f752e8b5da023'
	'4964ec3b817eddafb51a7d10f1440dfb')
build() {
	install -D xbslink.desktop $pkgdir/usr/share/applications/xbslink.desktop
	mkdir -p $pkgdir/opt/XBSlink
	cp xbslink.ico $pkgdir/opt/XBSlink/
	cp su-to-xbslink.sh $pkgdir/opt/XBSlink/
	chmod +x $pkgdir/opt/XBSlink/su-to-xbslink.sh
	cp * $pkgdir/opt/XBSlink -rp
}
