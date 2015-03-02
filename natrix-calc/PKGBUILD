# Maintainer: Mijo Medvedec <mijo dot medvedec at gmail dot com>

pkgname=natrix-calc
pkgver=2.3
pkgrel=1
pkgdesc="Generic IP calculator with ability to calculate parameters of IPv4/IPv6 networks"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/natrix/"
license=('GPL3')
depends=('qt4')
makedepends=('gendesk')
source=("http://sourceforge.net/projects/natrix/files/${pkgver}/${pkgname}_${pkgver}.zip")
md5sums=('f8c9be76329850a037d998d5f28487b9')
sha256sums=('24ad3d26745112fd622e938f153797dd53809bfff4e43926be6f82ff7d156ed7')

prepare() {
	gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

build() {
	cd "$srcdir/$pkgname"
	qmake-qt4 Natrix.pro
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

	install -dm 755 "$pkgdir/usr/share/$pkgname/locale"
	install -Dm 644 *.qm "$pkgdir/usr/share/$pkgname/locale"

	install -Dm 644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	sed -i 's/Natrix-calc/Natrix Calculator/g' "$pkgdir/usr/share/applications/$pkgname.desktop"
	sed -i 's/Office;/Network;Internet;/g' "$pkgdir/usr/share/applications/$pkgname.desktop"
}
