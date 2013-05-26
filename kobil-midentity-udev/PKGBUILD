# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=kobil-midentity-udev
pkgver=0.1.0
pkgrel=1
pkgdesc="Udev rules for the M-IDentity USB stick for the Swiss Migros Bank."
arch=('x86_64')
url="http://www.migrosbank.ch/de/MBancNet/MIDentity/faq_linuxkonf.htm"
license=('unknown')
depends=('lib32-dbus-glib' 'lib32-wxgtk' 'lib32-pangox-compat' 'lib32-libxaw')
source=(51-kobil-midentity.rules)
md5sums=('aef63e2b86531bab469f94ab849b6e6c')

package() {
  mkdir -p $pkgdir/usr/lib/udev/rules.d/
  cp 51-kobil-midentity.rules $pkgdir/usr/lib/udev/rules.d/51-kobil-midentity.rules
  chmod a+r $pkgdir/usr/lib/udev/rules.d/51-kobil-midentity.rules
}
