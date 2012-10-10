# Maintainer: Sascha Pfau <MrPeacock / web dot de>
# Contributor: Sascha Pfau <MrPeacock / web dot de>

pkgname=usb-modeswitch-notcl
pkgver=1.2.4
pkgrel=1
pkgdesc="USB_ModeSwitch is a mode switching tool for controlling flip flop USB gear"
arch=('i686' 'x86_64')
url="http://www.draisberghof.de/usb_modeswitch"
license=('GPL')
depends=('libusb')
makedepends=('gcc' 'make')
provides=('usb-modeswitch')
source=($url/usb-modeswitch-$pkgver.tar.bz2)
md5sums=('dbd4ce7966d7b4a5a0604a8280f7164d')

build() {
  cd $srcdir/usb-modeswitch-$pkgver/
  make || return 1
  make DESTDIR=$pkgdir install
}