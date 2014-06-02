# Maintainer: Figue <ffigue@gmail.com>
# Contributor: Archan Paul <arp@archan.org>

pkgname=usb-modeswitch-data
pkgver=20140529
pkgrel=1
pkgdesc="USB_ModeSwitch data - device database and the rules file for USB_ModeSwitch"
arch=('i686' 'x86_64')
url="http://www.draisberghof.de/usb_modeswitch"
license=('GPL')
depends=('libusb')
makedepends=('gcc' 'make' 'usb_modeswitch')
provides=($pkgname)
source=($url/$pkgname-$pkgver.tar.bz2)

md5sums=('dff94177781298aaf0b3c2a3c3dea6b2')

package() {
  mkdir -p $pkgdir/etc/usb_modeswitch.d
  install -Dm644 $srcdir/$pkgname-$pkgver/usb_modeswitch.d/* $pkgdir/etc/usb_modeswitch.d/
}

