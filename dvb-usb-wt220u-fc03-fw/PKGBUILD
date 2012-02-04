# Maintainer: Thilo Berndt <mail AT schlehmil DOT org>

pkgname=dvb-usb-wt220u-fc03-fw
pkgver=0.1
pkgrel=1
arch=('any')
license=('custom')
pkgdesc="Firmware file dvb-usb-wt220u-fc03.fw for Freecom DVB-T USB stick"
url="http://linuxtv.org/wiki/index.php/DVB-T_USB_Devices"
source=('http://home.arcor.de/efocht/dvb-usb-wt220u-fc03.fw')
md5sums=('381add05f30c95d56edd23a19467372c')

build() {
	mkdir -p $pkgdir/lib/firmware
	install -m644 $srcdir/dvb-usb-wt220u-fc03.fw $pkgdir/lib/firmware
}
