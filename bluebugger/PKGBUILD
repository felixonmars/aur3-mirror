# Maintainer: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>

pkgname=bluebugger
pkgver=0.1
pkgrel=0
pkgdesc="Bluebugger is an implementation of the bluebug technique which was discovered by Martin Herfurt."
arch=('any')
license=""
url="http://packetlife.net/armory/bluebugger/"
depends=('bluez')
source=('bluebugger-0.1.tar.gz')
md5sums=('a94f4356d904622daa69b35b9d13053e')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/${pkgname}-${pkgver}/bluebugger" "${pkgdir}/usr/bin"
}
