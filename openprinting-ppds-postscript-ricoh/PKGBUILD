# Maintainer: Nicholas Helke <nhelke@gmail.com>
pkgname=openprinting-ppds-postscript-ricoh
pkgver=20130611
pkgrel=1
pkgdesc="PPD files for Ricoh's PostScript printers, supplied by Ricoh"
arch=('any')
url="https://www.openprinting.org/driver/Postscript-Ricoh"
license=('MIT')
depends=('cups' 'foomatic-filters')
conflicts=(ppd-ricoh)
install=ricoh.install
source=('https://www.openprinting.org/download/printdriver/components/lsb3.2/main/RPMS/noarch/openprinting-ppds-postscript-ricoh-20130611-1lsb3.2.noarch.rpm')
md5sums=('42d3b39d33d11e293330aa85cd328f83')

package() {
  install -d $pkgdir/usr/share/cups/model/ $pkgdir/opt/OpenPrinting-Ricoh/doc
  install $srcdir/opt/OpenPrinting-Ricoh/ppds/Ricoh/* $pkgdir/usr/share/cups/model/
  cp -r $srcdir/opt/OpenPrinting-Ricoh/doc $pkgdir/opt/OpenPrinting-Ricoh/doc
}
