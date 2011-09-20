# Maintainer: Archan Paul <arp@archan.org>

pkgname=usb-modeswitch
pkgver=1.1.9
pkgrel=1
pkgdesc="USB_ModeSwitch - Handling Mode-Switching USB Devices on Linux"
arch=('i686' 'x86_64')
url="http://www.draisberghof.de/usb_modeswitch"
license=('GPL')
depends=('libusb')
makedepends=('gcc' 'make')
optdepends=('usb-modeswitch-data')
provides=($pkgname)
source=($url/$pkgname-$pkgver.tar.bz2)
md5sums=('76f6978f18cac41f269a346a5d0f1052')

build() {
  cd $srcdir/$pkgname-$pkgver/
  make || return 1
  make DESTDIR=$pkgdir install
}

