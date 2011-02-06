# Maintainer: Frank Thieme <frank@fthieme.net>

pkgname=dvb-usb-af9015-fw
pkgver=1
pkgrel=1
pkgdesc="Firmware dvb-usb-af9015.fw for MSI DigiVOX mini II V3.0"
arch=('any')
url="http://linuxtv.org/wiki/index.php/MSI_DigiVox_mini_II_V3.0"
license=('unknown')
source=('http://www.otit.fi/~crope/v4l-dvb/af9015/af9015_firmware_cutter/firmware_files/4.95.0/dvb-usb-af9015.fw')
md5sums=('dccbc92c9168cc629a88b34ee67ede7b')

build() {
#package() {
  install -Dm0644 $srcdir/dvb-usb-af9015.fw $pkgdir/lib/firmware/dvb-usb-af9015.fw
}

# vim:set ts=2 sw=2 et:
