# Maintainer: Faule Socke <github@socker.lepus.uberspace.de>

_srcname=wpa_supplicant
pkgname=wpa_supplicant-no-roaming
pkgver=2.0
pkgrel=1
pkgdesc="wpa_supplicant with patch disabling roaming. Often provides much better wifi connectivity."
url="http://hostap.epitest.fi/wpa_supplicant"
arch=('i686' 'x86_64')
depends=('openssl' 'dbus-core' 'readline' 'libnl')
optdepends=('wpa_supplicant_gui: wpa_gui program')
provides=('wpa_supplicant')
conflicts=('wpa_supplicant')
license=('GPL')
backup=('etc/wpa_supplicant/wpa_supplicant.conf')
source=("http://w1.fi/releases/${_srcname}-${pkgver}.tar.gz"
        'no-roaming.patch'
	    config)

build() {
  cd "${srcdir}/${_srcname}-${pkgver}/"
  cd "${_srcname}"

  cp "${srcdir}/config" ./.config

  sed -i 's@/usr/local@$(PREFIX)@g' Makefile

  # patch no-roaming
  patch -p1 < ${srcdir}/no-roaming.patch

  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${_srcname}-${pkgver}/${_srcname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install

  install -d -m755 "${pkgdir}/etc/wpa_supplicant"
  install -m644 wpa_supplicant.conf "${pkgdir}/etc/wpa_supplicant/wpa_supplicant.conf"

  install -d -m755 "${pkgdir}/usr/share/man/man"{5,8}
  install -m644 doc/docbook/*.5 "${pkgdir}/usr/share/man/man5/"
  install -m644 doc/docbook/*.8 "${pkgdir}/usr/share/man/man8/"
  rm -f "${pkgdir}/usr/share/man/man8/wpa_"{priv,gui}.8

  install -d -m755 "${pkgdir}/usr/share/dbus-1/system-services"
  install -m644 dbus/{fi.epitest.hostap.WPASupplicant.service,fi.w1.wpa_supplicant1.service} "${pkgdir}/usr/share/dbus-1/system-services/"

  install -d -m755 "${pkgdir}/etc/dbus-1/system.d"
  install -m644 dbus/dbus-wpa_supplicant.conf "${pkgdir}/etc/dbus-1/system.d/wpa_supplicant.conf"

  install -d -m755 "${pkgdir}/usr/lib/systemd/system"
  install -m644 systemd/*.service "${pkgdir}/usr/lib/systemd/system/"

  # usrmove
  cd "$pkgdir"/usr
  mv sbin bin
}
md5sums=('3be2ebfdcced52e00eda0afe2889839d'
         '8ad9299d596d7d36da7988e11ffe2d96'
         '4aa1e5accd604091341b989b47fe1076')
