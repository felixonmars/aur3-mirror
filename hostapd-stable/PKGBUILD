# $Id: PKGBUILD 105700 2014-02-14 09:18:44Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=hostapd-stable
_pkgname=hostapd
pkgver=2.0
pkgrel=6
pkgdesc="IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator currently stable version"
arch=('i686' 'x86_64')
url="http://w1.fi/hostapd/"
license=('custom')
depends=('openssl' 'libnl')
conflicts=('hostapd')
backup=('etc/hostapd/hostapd.conf'
        'etc/hostapd/hlr_auc_gw.milenage_db'
        'etc/hostapd/hostapd.accept'
        'etc/hostapd/hostapd.deny'
        'etc/hostapd/hostapd.eap_user'
        'etc/hostapd/hostapd.radius_clients'
        'etc/hostapd/hostapd.sim_db'
        'etc/hostapd/hostapd.vlan'
        'etc/hostapd/hostapd.wpa_psk'
        'etc/hostapd/wired.conf')
install=hostapd.install
source=(http://w1.fi/releases/$_pkgname-$pkgver.tar.gz
	config
	hostapd.service)
md5sums=('ba22e639bc57aa4035d2ea8ffa9bbbee'
         'eab3ae853869f832965f59898bb04a52'
         'a0a16879eed5e4e41ae6b225a4809955')

build() {
  cd $_pkgname-$pkgver/hostapd
  cp ../../config .config
  sed -i 's#/etc/hostapd#/etc/hostapd/hostapd#' hostapd.conf
  export CFLAGS="$CFLAGS $(pkg-config --cflags libnl-3.0)"
  make
}

package() {
  # Systemd unit
  install -Dm644 hostapd.service "$pkgdir/usr/lib/systemd/system/hostapd.service"

  cd $_pkgname-$pkgver

  # License
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"

  cd hostapd

  # Binaries
  install -d "$pkgdir/usr/bin"
  install -t "$pkgdir/usr/bin" hostapd hostapd_cli

  # Configuration
  install -d "$pkgdir/etc/hostapd"
  install -m644 -t "$pkgdir/etc/hostapd" \
    hostapd.{accept,conf,deny,eap_user,radius_clients,sim_db,vlan,wpa_psk} \
    wired.conf hlr_auc_gw.milenage_db

  # Man pages
  install -Dm644 hostapd.8 "$pkgdir/usr/share/man/man8/hostapd.8"
  install -Dm644 hostapd_cli.1 "$pkgdir/usr/share/man/man1/hostapd_cli.1"
}
