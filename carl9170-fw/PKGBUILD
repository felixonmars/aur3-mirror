# Submitter: Marius L. Meyer <marius.l.meyer at gmail dot com>
# Maintainer: David Manouchehri <david@davidmanouchehri.com>

pkgname=carl9170-fw
pkgver=1.9.7
pkgrel=1
pkgdesc="Firmware for the carl9170 WiFi driver"
arch=('i686' 'x86_64')
url="http://wireless.kernel.org/en/users/Drivers/carl9170"
license=('GPL2')
depends=()
makedepends=()
options=()
install=
source=('carl9170-1.fw::http://linuxwireless.org/en/users/Drivers/carl9170/fw$pkgver?action=AttachFile&do=get&target=carl9170-1.fw')
md5sums=('df28acc9a8ee53c7770b1a8f1f743763')

build() {
  mkdir -p $pkgdir/usr/lib/firmware
  cp $srcdir/* $pkgdir/usr/lib/firmware  
}
