# Maintainer: Fortunato Ventre (voRia) <vorione AT gmail DOT com>

pkgname=dvb-usb-wt220u-zl0353-01-fw
pkgver=1.0
pkgrel=1
pkgdesc="Firmware file dvb-usb-wt220u-zl0353-01.fw for Yakumo QuickStick Basic DVB-T"
url="http://linuxtv.org/wiki/index.php/DVB-T_USB_Devices"
license=('custom')
arch=('any')
source=('http://www.voria.org/files/dvb/dvb-usb-wt220u-zl0353-01.fw')
md5sums=('d86439e4b5426a6b7bd79cffccd40046')

package() {
  mkdir -p "${pkgdir}/lib/firmware/"
  install -D -m644 "${srcdir}/dvb-usb-wt220u-zl0353-01.fw" "${pkgdir}/lib/firmware/"
}

# vim:set ts=2 sw=2 et:

