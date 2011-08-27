# dw2102-Firmware: Installer: Arch
# Maintainer: Fabrizio Monti <monti (dot) fabrizio (at) gmail (dot) com>

pkgname=dvb-usb-dw2102
pkgver=20110611
pkgrel=2
pkgdesc="Firmware for Terratec Cinergy S DVB-S USB"
arch=("any")
url="http://liplianin.at.tut.by/ds110en.html"
license=("GPL2")
options=(!emptydirs)
source=(http://liplianin.at.tut.by/dvb-usb-dw2102.fw)

build() {
	/bin/true
}

package() {
	cd "${srcdir}"

	# Directories
	install -d "${pkgdir}"/lib/firmware/

	# Install
	install -m 644 ${pkgname}.fw "${pkgdir}"/lib/firmware/
}

md5sums=('3d88c577b7a1ef370cef039cec3f665f')
