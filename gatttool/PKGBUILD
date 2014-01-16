# $Id$
# Maintainer: Erwin Lopez<erwinkendo@gmail.com>

pkgname=gatttool
pkgver=5.13
pkgrel=1
pkgdesc="Command line tool to run common GATT procedures (BLE - Bluetooth4.0)"
url="http://www.bluez.org/"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('dbus' 'libical' 'systemd')
source=(http://www.kernel.org/pub/linux/bluetooth/bluez-${pkgver}.tar.xz)
md5sums=('c68f8cb270110256a684403ee43b5f79')

build() {
  cd bluez-${pkgver}
  ./configure \
          --prefix=/usr \
          --mandir=/usr/share/man \
          --sysconfdir=/etc \
          --localstatedir=/var \
          --libexecdir=/usr/lib \
          --enable-sixaxis \
          --enable-library # this is deprecated
#          --enable-experimental \

  make
}
package() {
  cd bluez-${pkgver}
  install -vDm755 attrib/gatttool "${pkgdir}/usr/bin/gatttool"

}