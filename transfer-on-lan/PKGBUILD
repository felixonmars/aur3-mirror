# Maintainor: Heine Laursen <zannvip at gmail dot com>

pkgname=transfer-on-lan
pkgver=0.4.11
pkgrel=1
pkgdesc="Cross-platform file transferring on LAN without configuration"
arch=('i686' 'x86_64')
url="http://code.google.com/p/transfer-on-lan/"
license=('GPL3')
depends=('java-runtim')
#makedepends=('pkgconfig>=0.9')
#install=$pkgname.install
source=(http://transfer-on-lan.googlecode.com/files/TransferOnLAN-0.4.11.tar.gz)
md5sums=('a2a4a3defc62cdbb8f9cedcddb833098')
build() {
  cd TransferOnLAN-0.4.11

  install -d $pkgdir/usr/bin
  install TransferOnLAN.jar $pkgdir/usr/bin
  install TransferOnLAN.sh $pkgdir/usr/bin

  install -d $pkgdir/usr/share/pixmaps/
  install TransferOnLAN.png $pkgdir/usr/share/pixmaps/
  }

# vim:set ts=2 sw=2 et:
