# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=bluelog
pkgver=1.1.2
pkgrel=1
pkgdesc="A Linux Bluetooth scanner and sniffer written to do a single task, log devices that are in discoverable mode"
url=('http://www.digifail.com/software/bluelog.shtml')
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('bluez-libs')
depends=('bluez')
source=("http://dl.packetstormsecurity.net/wireless/${pkgname}-${pkgver}.tar.gz")
sha512sums=('215e10280ab9859ad1e0442afbe39d4a1b4e1dd2f4a930b81364fe3d2a6e318d46d8afd1f4ea0f1035c742ea6b3a7a92aaeeb2e71b4e3fa0e556f17e70ccb10a')
build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}
package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
