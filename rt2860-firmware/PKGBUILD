#Contributor Christoph Haag
pkgname=rt2860-firmware
pkgver=26
pkgrel=2
pkgdesc="Firmware RT28XX/RT30XX PCI/mPCI/PCIe/CardBus series (RT2760/RT2790/RT2860/RT2890/RT3060/RT3062/RT3562/RT2860/RT2760/RT2890/RT2790/RT3090)"
arch=('i686' 'x86_64')
url="http://www.ralinktech.com/support.php?s=2"
license="proprietary"
depends=()
install=install.rt2860-firmware
source=('http://www.ralinktech.com/download.php?t=U0wyRnpjMlYwY3k4eU1ERXdMekEzTHpFMkwyUnZkMjVzYjJGa05qZ3hPRFUwTmpBd05DNWllakk5UFQweU1ERXdYekEzWHpFMlgxSlVNamcyTUY5TWFXNTFlRjlUVkVGZmRqSXVOQzR3TGpBdWRHRnlD')

build() {
cd $startdir/src/RT2860_Firmware_V26
install -D -m644 rt2860.bin $pkgdir/lib/firmware/rt2860.bin
}
md5sums=('b2623a02a006e1b18eea1b9ab58495f0')
