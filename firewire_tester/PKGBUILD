# Maintainer: Aapo Vienamo <aapo.vienamo@iki.fi> 
pkgname=firewire_tester
pkgver=1
pkgrel=1
pkgdesc="Test FireWire connectivity and stabilize broadcast FireWire \
  connections. "
arch=(any)
url="http://www.mythtv.org/wiki/Firewire_tester"
license=('GPLv2')
depends=('libraw1394' 'libiec61883')
source=("firewire_tester.c")
md5sums=('a75f7b5e67130ccef367a2786c2996cb')

build() {
  gcc -Wall -o firewire_tester firewire_tester.c -liec61883 -lraw1394
}

package() {
  mkdir -p $pkgdir/usr/bin/
  cp firewire_tester $pkgdir/usr/bin/
}

# vim:set ts=2 sw=2 et:
