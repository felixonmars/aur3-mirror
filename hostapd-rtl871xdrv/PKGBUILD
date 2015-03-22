# $Id: PKGBUILD 112859 2014-06-09 09:56:13Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=hostapd-rtl871xdrv
pkgver=2.2
pkgrel=3
pkgdesc="IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator with rtl871xdrv driver for Wifi chips like RT8188C and RT8192C"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm')
url="https://github.com/pritambaral/hostapd-rtl871xdrv"
license=('custom')
makedepends=('git')
depends=('openssl' 'libnl')
install=hostapd.install
options=(emptydirs)
provides=('hostapd')
conflicts=('hostapd')
source=(http://w1.fi/releases/hostapd-$pkgver.tar.gz
	config
	hostapd.service
	git${url#https}.git
)
md5sums=('23c1f78a693c3288802d516adb7fd289'
         '636e468b1dbffb97f360f6b449006e36'
         'a0a16879eed5e4e41ae6b225a4809955'
	 'SKIP')

prepare() {
  cd hostapd-$pkgver
  patch -p1 < ../$pkgname/rtlxdrv.patch
  cp ../$pkgname/driver_* src/drivers
}

build() {
  cd hostapd-$pkgver/hostapd
  cp ../../config .config
  sed -i 's#/etc/hostapd#/etc/hostapd/hostapd#' hostapd.conf
  export CFLAGS="$CFLAGS $(pkg-config --cflags libnl-3.0)"
  make
}

package() {
  # Systemd unit
  install -Dm644 hostapd.service "$pkgdir/usr/lib/systemd/system/hostapd.service"

  cd hostapd-$pkgver

  # License
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  cd hostapd

  # Binaries
  install -d "$pkgdir/usr/bin"
  install -t "$pkgdir/usr/bin" hostapd hostapd_cli

  # Configuration
  install -d "$pkgdir/etc/hostapd"
  install -d "$pkgdir/usr/share/doc/hostapd"
  install -m644 -t "$pkgdir/usr/share/doc/hostapd" \
    hostapd.{accept,conf,deny,eap_user,radius_clients,sim_db,vlan,wpa_psk} \
    wired.conf hlr_auc_gw.milenage_db

  # Man pages
  install -Dm644 hostapd.8 "$pkgdir/usr/share/man/man8/hostapd.8"
  install -Dm644 hostapd_cli.1 "$pkgdir/usr/share/man/man1/hostapd_cli.1"
}
