# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=cinnamon-applet-touchpad-classic
pkgver=0.98
pkgrel=1
pkgdesc="Touchpad and Trackpoint management applet for Cinnamon."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/applets/view/103"
license=('GPL')
depends=('cinnamon')
source=('http://cinnamon-spices.linuxmint.com/uploads/applets/DVDN-MDZG-QCSR.zip')

package() {
  mkdir -p "$pkgdir"/usr/share/cinnamon/applets/
  cp -r "${srcdir}"/TouchpadIndicatorClassic@lusito.info "$pkgdir"/usr/share/cinnamon/applets/
  chown -R root:root "$pkgdir"
}

sha256sums=('ed1281f02ed644921d3123b7da1628ee17bde9652a0e74f1720c3fb19aef9f5e')
