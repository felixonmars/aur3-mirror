# Benjamin Mtz (Cruznick) <cruznick at archlinux dot us>

pkgname=compat-wireless-patched-daily
srcname=compat-wireless
pkgver=2011_03_31
pkgrel=1
pkgdesc='compat wireless driver patched for fixing issues with "fixed-channel -1" and mac80211 patch from aircrack(daily builds)'
arch=('i686' 'x86_64')
url='http://wireless.kernel.org/'
license=('GPL')
depends=('kernel26')
makedepends=('linux-api-headers' 'kernel26-headers')
install=compat-wireless-patched.install
source=(http://wireless.kernel.org/download/compat-wireless-2.6/$srcname-${pkgver//_/-}.tar.bz2 \
         'channel-negative-one-maxim.patch' \
         'mac80211.compat08082009.wl_frag+ack_v1.patch')
sha1sums=('8b3a9896e95861c103f8aeb29614fc6f6578dc6d' 
           'a611acdd7994b07b0b39417ef7a5a6ffc866a733'
	   '85f7a1b141549b774f5631fba259bc414aeeffb8')

changelog=$pkgname.changelog

	##--Drivers-options--###
	# Supported 802.11 drivers:
	#	ath5k
	#	ath9k
	#	ath9k_htc
	#	ar9170
	#	b43
	#	zd1211rw
	#	rt2x00

	# Supported Ethernet drivers:
	#	atl1
	#	atl2
	#	atl1e
	#	atl1c

	# Supported groups of drivers:
	# atheros <  ath5k ath9k ar9170 zd1211rw >
	# ath <  ath5k ath9k ar9170 >
	# intel <  iwl3945 iwlagn ipw2100 ipw2200 >
	# iwlwifi <  iwl3945 iwlagn >
	# rtl818x <  rtl8180 rtl8187 >
	# wl12xx <  wl1251 (SPI and SDIO) wl1271 >


build() {


  cd "$srcdir/$srcname-${pkgver//_/-}"
  
  #Patching 
  msg "Applying some patches"
  patch --verbose -p1 -i ${srcdir}/mac80211.compat08082009.wl_frag+ack_v1.patch 
  patch --verbose -p1 -i ${srcdir}/channel-negative-one-maxim.patch 

   msg "Supported 802.11 drivers:"
   msg "	ath5k"
   msg "	ath9k"
   msg "	ath9k_htc"
   msg "	carl9170"
   msg "	b43"
   msg "	zd1211rw"
   msg "	rt2x00"
   msg "	wl1251"
   msg "	wl12xx"
   msg "	ath6kl"
   msg "	brcm80211"
   msg "Supported group drivers:"
   msg "	atheros <  ath5k ath9k carl9170 zd1211rw >"
   msg "	ath <  ath5k ath9k carl9170 >"
   msg "	iwlagn <  iwlagn >"
   msg "	intel <  iwl3945 iwlagn >"
   msg "	rtl818x <  rtl8180 rtl8187 >"
   msg "	rtlwifi <  rtl8192ce >"
   msg "	wl12xx <  wl1251 wl12xx (SPI and SDIO)>  "
   msg "Supported group drivers: Bluetooth & Ethernet:"
   msg "	atlxx <  atl1 atl2 atl1e atl1c >"
   msg "	bt <  Linux bluetooth drivers >"

   msg2 "Please write the name of your driver or group, if you don't know which ones or want all please type 'all'"
 
  read answer
  
  if [[ "$answer" = "all" ]]; then
     msg "Starting build of all drivers"
  else
  scripts/driver-select $answer || return 1
  msg "Starting build of $answer drivers "
   fi
  
  ##uncomment if you encounter problems with rt2870 
  #sed -i 's/^\# CONFIG_RT2800USB_RT30XX/CONFIG_RT2800USB_RT30XX/' config.mk

  make || return 1
  make INSTALL_MOD_PATH=$pkgdir install-modules || return 1
 
  # gzip -9 all modules (required by 2.6.37-3+) <alphazo fix>
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;

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
