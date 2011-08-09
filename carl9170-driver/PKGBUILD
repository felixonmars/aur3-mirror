# Maintainer: Marius L. Meyer <marius.l.meyer at gmail dot com>

pkgname=carl9170-driver
pkgver=2011_05_14
_reldate="2011-05-14"
pkgrel=2
pkgdesc="A new WiFi driver for Atheros based USB dongles"
arch=('i686' 'x86_64')
url="http://wireless.kernel.org/en/users/Drivers/carl9170"
license=('GPL2')
depends=('carl9170-fw')
makedepends=('linux-api-headers' 'linux-headers')
optdepends=(
	    'wireless-regdb'
	    'crda'
	    'iw'
	    'rfkill')

options=()
install=$pkgname.install
source=(http://wireless.kernel.org/download/compat-wireless-2.6/compat-wireless-$_reldate.tar.bz2)
md5sums=('58a675845c430d3a0e43f036e4520386')

build() {
  cd compat-wireless-$_reldate
  ./scripts/driver-select carl9170
  make
}

package() {
  kernver=$(uname -r)
  mkdir -p $pkgdir/lib/modules/$kernver/updates/drivers/net/wireless/ath/carl9170
  mkdir -p $pkgdir/lib/modules/$kernver/updates/{compat,net/{mac80211,wireless}}
  cd compat-wireless-$_reldate
  make KMODPATH_ARG="INSTALL_MOD_PATH=$pkgdir" install-modules
}

