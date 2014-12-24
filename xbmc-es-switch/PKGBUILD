# Maintainer: Patrick Ulbrich <zulu99 at gmx . net>

pkgname=xbmc-es-switch
pkgver=0.5.0
pkgrel=1
pkgdesc="Systemd service that boots into XBMC or EmulationStation depending on the state of a joypad button"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/pulb/xbmc-es-switch"
license=('GPL')
depends=('xbmc' 'emulationstation-git-unstable-rpi')
source=('https://github.com/pulb/xbmc-es-switch/archive/v0.5.0.tar.gz')
md5sums=('df867825e5e5e2cca5cadfab2daa5294')
install='xbmc-es-switch.install'

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
 	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
