# Maintainer: Slappinjohn <slappinjohn@gmx.net>
# Contributor: Slappinjohn <slappinjohn@gmx.net>

pkgname=eee-fan
pkgver=0.2
pkgrel=1
pkgdesc="control fan_speed on EeePc, written by Dougal for Puppy Linux, adopted by slappinjohn"
arch=('i686' 'x86_64')
license=('GPL')
depends=('acpi-eee901' 'gtkdialog')
provides=('eee-fan')
url="http://www.murga-linux.com/puppy/viewtopic.php?p=244260"

source=()
md5sums=()


build() {

  install -Dm744 -oroot ${startdir}/eee-fan ${startdir}/pkg/etc/rc.d/eee-fan
  install -Dm644 -oroot ${startdir}/eee-fan.conf ${startdir}/pkg/etc/eee-fan.conf
  install -Dm744 -oroot ${startdir}/eee-fan-ctrl.sh ${startdir}/pkg/usr/sbin/eee-fan-ctrl.sh
  install -Dm755 -oroot ${startdir}/eee-fan-config.sh ${startdir}/pkg/usr/sbin/eee-fan-config.sh

}
# vim:syntax=sh
