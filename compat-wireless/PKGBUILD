# Maintainer:  hokasch <hokasch at operamail dot com>
# Contributor: Dennis Brendel <buddabrod at gmail dot com>

pkgname=compat-wireless
pkgver=2011_03_30
pkgrel=1
pkgdesc='Snapshots of the wireless-testing tree ported to older kernels'
arch=('i686' 'x86_64')
url='http://wireless.kernel.org/'
license=('GPL')
depends=('kernel26')
makedepends=('linux-api-headers')
install=$pkgname.install
source=(http://wireless.kernel.org/download/compat-wireless-2.6/$pkgname-${pkgver//_/-}.tar.bz2)

sha1sums=('b2bac1330e9f9b471202ac30b654f19620e66df2')



build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  
  ##select driver (optional): ath9k ath9k_htc ar9170 b43 zd1211rw
  #scripts/driver-select ath9k 

  ##uncomment if you encounter problems with rt2870 
  #sed -i 's/^\# CONFIG_RT2800USB_RT30XX/CONFIG_RT2800USB_RT30XX/' config.mk
  
  make || return 1
  make INSTALL_MOD_PATH=$pkgdir install-modules || return 1
  install -dm755 $pkgdir/usr/sbin
  install -dm755 $pkgdir/lib/udev/rules.d
  install -dm755 $pkgdir/usr/lib/compat-wireless
  install scripts/madwifi-unload	$pkgdir/usr/sbin/
  install scripts/athenable		$pkgdir/usr/sbin/
  install scripts/b43enable		$pkgdir/usr/sbin/
  install scripts/iwl-enable		$pkgdir/usr/sbin/
  install scripts/athload		$pkgdir/usr/sbin/
  install scripts/b43load		$pkgdir/usr/sbin/
  install scripts/iwl-load		$pkgdir/usr/sbin/
  install udev/compat_firmware.sh	$pkgdir/lib/udev/
  install udev/50-compat_firmware.rules $pkgdir/lib/udev/rules.d/
  install scripts/modlib.sh		$pkgdir/usr/lib/compat-wireless/
  install scripts/check_depmod  	$pkgdir/usr/lib/compat-wireless/
}







