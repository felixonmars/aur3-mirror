# Maintainer: hugo <hugo_lobo@sapo.pt>

pkgname=firmware-speedtouch-rev2
pkgver=3.0.1.2
pkgrel=1
pkgdesc="Firmware for Alcatel Speedtouch USB modems revision 2"
url="http://www.speedtouch.com/"
license="SpeedTouch-USB-Firmware"
makedepends=('gcc')
conflicts=('speedtch')
backup=()
source=(http://www.linux-usb.org/SpeedTouch/firmware/firmware-extractor.tar.gz http://www.speedtouch.com/download/drivers/USB/SpeedTouch330_firmware_3012.zip)
md5sums=('752e33faf0b62176114e757dfc1e7191' '2551ce46ef785642f2c6768511f70ff3')

build() {
  cp 
  cd $startdir/src/firmware-extractor
  install -m 644 ../KQD6_3.012 $startdir/src/firmware-extractor/mgmt.o 
  ./configure
  make || return 1
  install -p -d -m 755 $startdir/pkg/lib/firmware
  install -m 600 speedtch-{1,2}.bin $startdir/pkg/lib/firmware
  }

