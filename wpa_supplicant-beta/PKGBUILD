# Maintainer: blasse <koralik(at)gmail(dot)com>

pkgname=wpa_supplicant-beta
_pkgbase=wpa_supplicant
pkgver=0.7.2
pkgrel=1
pkgdesc="A utility providing key negotiation for WPA wireless networks"
arch=('i686' 'x86_64')
depends=('openssl' 'dbus-core>=1.2.4' 'readline>=6.0' 'libnl')
optdepends=('wpa_supplicant_gui: wpa_gui program')
license=('GPL')
groups=('base')
provides=('wpa_supplicant=0.7.2')
conflicts=('wpa_supplicant')
backup=('etc/wpa_supplicant.conf')
url="http://hostap.epitest.fi/wpa_supplicant"
source=(http://hostap.epitest.fi/releases/wpa_supplicant-$pkgver.tar.gz
        config)
sha256sums=('df002a75376fc3f8bc0082771d1accadf60891515e08ac5b7ca044fa9985dcbe'
            '2c11dfb963a0ed0959766bdce96e349bec66955fa30445b6099eda6b56ffe04b')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}/${_pkgbase}"
  cp ${srcdir}/config ./.config
  sed -i 's@/usr/local@$(PREFIX)@g' Makefile
  make || return 1
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}/${_pkgbase}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install || return 1
  install -m755 -d "${pkgdir}/etc"
  install -m644 wpa_supplicant.conf "${pkgdir}/etc/wpa_supplicant.conf" || return 1
  install -d -m755 ${pkgdir}/usr/share/man/man{5,8} || return 1
  install -m644 doc/docbook/wpa_supplicant.conf.5 "${pkgdir}/usr/share/man/man5/" || return 1
  install -m644 doc/docbook/{wpa_background,wpa_cli,wpa_passphrase,wpa_supplicant}.8 "${pkgdir}/usr/share/man/man8/" || return 1

  cd "${srcdir}/${_pkgbase}-${pkgver}/${_pkgbase}/dbus"
  install -m755 -d "${pkgdir}/usr/share/dbus-1/system-services"
  install -m644 fi.epitest.hostap.WPASupplicant.service "${pkgdir}/usr/share/dbus-1/system-services/fi.epitest.hostap.WPASupplicant.service" || return 1
  sed -e 's/sbin/usr\/sbin/' -i "${pkgdir}/usr/share/dbus-1/system-services/fi.epitest.hostap.WPASupplicant.service" || return 1
  cd "${srcdir}/${_pkgbase}-${pkgver}/${_pkgbase}/dbus"
  install -m755 -d "${pkgdir}/etc/dbus-1/system.d"
  install -m644 dbus-wpa_supplicant.conf "${pkgdir}/etc/dbus-1/system.d/fi.epitest.hostap.WPASupplicant.conf" || return 1
}
