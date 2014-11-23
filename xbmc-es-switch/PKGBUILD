# Maintainer: Patrick Ulbrich <zulu99 at gmx . net>

pkgname=xbmc-es-switch
pkgver=0.3.0
pkgrel=1
pkgdesc="A small utility that switches between XBMC and Emulationstation at boottime via joypad button press"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/pulb/xbmc-es-switch"
license=('GPL')
depends=('xbmc' 'emulationstation-git-unstable-rpi')
source=('https://github.com/pulb/xbmc-es-switch/archive/v0.3.0.tar.gz')
md5sums=('18f3b5f02bd4e1646f3f36c3a56ade6f')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
 	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
