# Maintainer: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=quakeusbmodem-firmware
pkgver=1.0
pkgrel=1
pkgdesc="Firmware for quake usb adsl modems (conexant)"
arch=(i686)
url="http://www.quake.com.tr/"
license=('GPL')
depends=('rp-pppoe')
source=(http://www.difuzyon.net/linux/cxacru-fw.bin)
md5sums=('fe7386afd6399b29705c6f2b3e71f4b9')

build() {
  cd $srcdir
  mkdir -p $pkgdir/lib/firmware
  install -m644 cxacru-fw.bin $pkgdir/lib/firmware
}