# Contributor: santodelaespada<sebastianbenvenuti@gmail.com>
pkgname=bdaddr
pkgver=200902
pkgrel=1
pkgdesc="Change Bluetooth MAC address"

arch=(any)
url="http://www.siddharthabbineni.com/tech/hardware/change-bluetooth-device-mac-address.html"
license="GPL"
depends=('bluez')
source=(http://www.siddharthabbineni.com/wp-content/uploads/2009/02/bdaddrtar.bz2)
md5sums=('8e4ecc4709b1d291ab1cc8cf796c595b')

build() {
  cd $srcdir
  tar axf bdaddrtar.bz2
  cd bdaddr
  make || return 1
  mkdir -p $pkgdir/opt/bdaddr
  mv bdaddr bdaddr.o oui.o $pkgdir/opt/bdaddr
}
