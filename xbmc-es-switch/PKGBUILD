# Maintainer: Patrick Ulbrich <zulu99 at gmx . net>

pkgname=xbmc-es-switch
pkgver=0.4.0
pkgrel=1
pkgdesc="A small utility that switches between XBMC and Emulationstation at boottime via joypad button press"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/pulb/xbmc-es-switch"
license=('GPL')
depends=('xbmc' 'emulationstation-git-unstable-rpi')
source=('https://github.com/pulb/xbmc-es-switch/archive/v0.4.0.tar.gz')
md5sums=('5a8d54dd5a3ff1266306b3657896c621')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
 	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
