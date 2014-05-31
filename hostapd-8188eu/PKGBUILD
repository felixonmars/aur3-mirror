# Maintainer: Vojtěch Aschenbrenner <v@asch.cz>

pkgname=hostapd-8188eu
pkgver=0.8
pkgrel=1
pkgdesc="IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator, compatible with Realtek RTL8188EU chipset wireless cards"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="http://www.realtek.com.tw/"
license=('GPL2')
depends=('openssl' 'libnl')
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
makedepends=('git')
conflicts=(hostapd)
provides=(hostapd)
source=("${pkgname}-${pkgver}::git://github.com/jenssegers/RTL8188-hostapd.git"
        hostapd.install
        hostapd.service)

sha512sums=('SKIP'
            'bff95ca2120530391e662481831ef66122c145650a58aefdbe4cd9a4caa418cd4373841a4ba2a9b4ddf0f24b97dbc5ef8f8af82003aa5a059d992eb6eab21457'
            'f297f1f24c56b1b1dd4627dfeec96175184cf65f685573bdabcb7551bf42e246e8f198fb04dda0a052c795d8dbbc67dfa2cc558269bcdce4acd7d6b37fdb2d2c')

build() {
  cd $pkgname-$pkgver/hostapd
  ## Fix some configurations
  # Driver
  sed -i 's#driver=hostap#driver=rtl871xdrv#' hostapd.conf
  # Channel
  sed -i 's#channel=60#channel=1#' hostapd.conf
  # Wifi mode
  sed -i 's#hw_mode=a#hw_mode=g#' hostapd.conf
  # Path for configurations
  sed -i 's#/etc/hostapd#/etc/hostapd/hostapd#' hostapd.conf
  export CFLAGS="$CFLAGS $(pkg-config --cflags libnl-3.0)"
  make
}

package() {
  # Systemd unit
  install -Dm644 hostapd.service "$pkgdir/usr/lib/systemd/system/hostapd.service"

  cd $pkgname-$pkgver

  # License
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

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
