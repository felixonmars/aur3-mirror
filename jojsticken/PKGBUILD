# Contributor : mightyjaym <jmambrosino@gmail.com>

pkgname=jojsticken
pkgver=0.0.5
pkgrel=2
pkgdesc="Maps keypresses on your gamepad/joypad/joystick to keypresses on a keyboard"
arch=(i686 x86_64)
url="http://jojsticken.sourceforge.net/"
license=('GPL')
depends=('sdljava')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.zip ${pkgname})
md5sums=('a222dd11f5200a823c5d6ee20a02b370'
         'fca38646027c3e83cf3c7087ce3add67')

build() {

install -D -m644 ${srcdir}/${pkgname}-${pkgver}/${pkgname}.jar ${pkgdir}/usr/share/java/${pkgname}.jar
install -D -m755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

}