# Maintainer: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=colorcode
pkgver=0.7.2
pkgrel=1
pkgdesc="Free MasterMind game clone"
arch=('i686' 'x86_64')
url="http://colorcode.laebisch.com/"
license=('GPL3')
depends=('qt4')
source=(http://colorcode.laebisch.com/download/ColorCode-$pkgver.tar.gz colorcode.desktop)
sha256sums=('d1c5bf4d65c81de16c4159c2c69c096fc7ff47cca587d7233985e078d63c79aa'
            '57d6ed27307404d842f3a9aab5601fdc97544d083a782596868a06448a3d3252')
build() {
	cd ${srcdir}/ColorCode-$pkgver
	qmake4
	make
}
package() {
	cd ${srcdir}/ColorCode-$pkgver
	install -Dm755 colorcode ${pkgdir}/usr/bin/colorcode
	install -Dm644 ../colorcode.desktop ${pkgdir}/usr/share/applications/colorcode.desktop
	install -Dm644 img/cc64.png ${pkgdir}/usr/share/pixmaps/cc64.png
}

