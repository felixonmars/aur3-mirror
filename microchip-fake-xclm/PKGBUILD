pkgname=microchip-fake-xclm
pkgver=1.00
pkgrel=1
pkgdesc="fake xclm"
arch=(any)
url='http://www.microchip.com/pagehandler/en_us/promo/mplabxc'
license=(custom)

package() {
  mkdir -p $pkgdir/opt/microchip/xclm/{bin,license} &> /dev/null
  echo -e "#! /bin/sh\nexit 0" > $pkgdir/opt/microchip/xclm/bin/xclm
  chmod 0755 $pkgdir/opt/microchip/xclm/bin/xclm
} 
