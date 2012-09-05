# Maintainer: N30N <archlinux@alunamation.com>

pkgname="dvb-usb-technisat-fw"
pkgver=1
pkgrel=1
pkgdesc="Firmware for TechniSat's SkyStar USB HD product"
url="http://www.linuxtv.org/wiki/index.php/Technisat_SkyStar_USB_HD"
license=("custom")
arch=("any")
depends=()
makedepends=()
source=("http://kernellabs.com/firmware/technisat-usb2/dvb-usb-SkyStar_USB_HD_FW_v17_63.HEX.fw" \
	"http://kernellabs.com/firmware/technisat-usb2/dvb-usb-SkyStar_USB_HD_FW_v17_63.HEX.fw.license.txt")
md5sums=("e313da69c3585435e7a02b543c5d668d" "cb38fcc395213a4f85feadf101466309")

package() {
	cd "${srcdir}"
	install -Dm644 dvb-usb-SkyStar_USB_HD_FW_v17_63.HEX.fw \
		"${pkgdir}/usr/lib/firmware/dvb-usb-SkyStar_USB_HD_FW_v17_63.HEX.fw"
	install -Dm644 dvb-usb-SkyStar_USB_HD_FW_v17_63.HEX.fw.license.txt \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set noet ff=unix:
