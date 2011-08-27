# Contributor: Igor "Furester" Scabini <furester @ gmail . com>
pkgname=openmoko-usb-networking
pkgver=0.2
pkgrel=1
pkgdesc="script to communicate via TCP/IP to FreeRunner"
arch=(i686 x86_64)
url="http://wiki.openmoko.org/wiki/USB_Networking"
license=('unknown')
groups=('openmoko')
depends=('udev' 'iptables')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=""
source=('z60_openmoko_net.rules' 'openmoko-usb-networking')
noextract=()
md5sums=('fff21851c313dd0c3b67dcf4cf9c8cac'
         '785529224918a5b37102a741a8c4c36d')

build() {
  mkdir -p $pkgdir/etc/udev/rules.d/
  mkdir -p $pkgdir/etc/rc.d/

  install -m755 $srcdir/z60_openmoko_net.rules $pkgdir/etc/udev/rules.d/z60_openmoko_net.rules
  install -m755 $srcdir/openmoko-usb-networking $pkgdir/etc/rc.d/openmoko-usb-networking

}

# vim:set ts=2 sw=2 et:
