# Maintainer:  hokasch <hokasch at operamail dot com>
# Contributor: Dennis Brendel <buddabrod at gmail dot com>
# Contributor: Mathias Buren <mathias.buren at gmail dot com>

pkgname=compat-wireless-all
srcname=compat-wireless
# pkgver=$(date +%Y_%m_%d)
pkgver=2010_08_26
pkgrel=2
pkgdesc='Snapshots of the wireless-testing tree ported to older kernels, for all installed kernels'
arch=('i686' 'x86_64')
url='http://wireless.kernel.org/'
license=('GPL')
depends=('kernel26')
makedepends=('linux-api-headers' 'kernel26-headers')
install=$pkgname.install
source=(http://wireless.kernel.org/download/compat-wireless-2.6/$srcname-${pkgver//_/-}.tar.bz2)

### Enable using of version numbers from pacman. This should only be used if you have kernels with
### long version numbers (for example if compiled with git-suffixes). This will not work with kernels
### compiled outside pacman's management, and takes much longer than the canonical method, due to 
### needing to search the local repository. Set to '1' to enable.
USE_PACMAN_VERSION=0

# If you don't want to build all drivers, select which group you want to build
# below by setting the variable to the group name. If the variable is empty then
# then all drivers will be built. Example:
# DRIVER_GROUP='iwlwifi'

# Supported groups of drivers:
# atheros <  ath5k ath9k ar9170 zd1211rw >
# ath <  ath5k ath9k ar9170 >
# intel <  iwl3945 iwlagn ipw2100 ipw2200 >
# iwlwifi <  iwl3945 iwlagn >
# rtl818x <  rtl8180 rtl8187 >
# wl12xx <  wl1251 (SPI and SDIO) wl1271 >

DRIVER_GROUP='iwlwifi'

build() {

  if [ "$USE_PACMAN_VERSION" = "0" ]; then
   _KERNELS=`file /boot/* | grep 'Linux kernel.*boot executable' | sed 's/.*version \([^ ]\+\).*/\1/'`
   # Skip -git kernels, they don't work for now, for some reason
  else
    _PACKAGES=`pacman -Qsq kernel26`
    _KERNELS=`pacman -Ql $PACKAGES | grep /modules.alias.bin | sed 's/kernel26.*\/lib\/modules\/\(.*\)\/modules.alias.bin/\1/g'`
  fi

  cd "$srcdir/$srcname-${pkgver//_/-}"
  
  ##uncomment if you encounter problems with rt2870 
  #sed -i 's/^\# CONFIG_RT2800USB_RT30XX/CONFIG_RT2800USB_RT30XX/' config.mk

  # Select the driver group
  if [ "DRIVER_GROUP" = "" ]; then
    msg "All drivers selected for build."
  else
    msg "Selecting $DRIVER_GROUP as requested..."
    scripts/driver-select $DRIVER_GROUP || return 1  
  fi

  # Loop through all detected kernels and build
  for _kernver in $_KERNELS; do  
    msg "Building drivers for $_kernver ..."
    make KLIB=/lib/modules/${_kernver} || return 1

    msg "Done building for $_kernver."
    msg "Installing modules for $_kernver inside package..."
    mkdir -p $pkgdir/lib/modules/${_kernver}/updates/drivers/{net/{wireless,mac80211,bluetooth/{bnep,cmtp,hidp,rfcomm}},ssb,misc/eeprom,bluetooth}
    mkdir -p $pkgdir/lib/modules/${_kernver}/updates/{compat,net/{bluetooth/{bnep,cmtp,hidp,rfcomm},mac80211,wireless}}

    make KLIB=/lib/modules/${_kernver} KMODPATH_ARG="INSTALL_MOD_PATH=$pkgdir" install-modules || return 1
    msg "Done installing modules for $_kernver."

  done
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

md5sums=('23dde666670ab8225d596c421874e0ad')
