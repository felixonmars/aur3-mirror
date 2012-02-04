# $Id: PKGBUILD 59764 2009-11-27 15:03:14Z ibiru $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contrinutor: Arjan Timmerman <arjan@archlinux.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Peter Bui <pnutzh4x0r@gmail.com>

_pkgname=network-manager-applet
pkgname=${_pkgname}-notify-osd
pkgver=0.8.2
pkgrel=4
pkgdesc="GNOME frontends to NetWorkmanager"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/projects/NetworkManager/"
makedepends=('pkgconfig' 'intltool')
depends=('networkmanager>=0.8.2' 'libglade' 'libgnome-keyring' 'polkit-gnome' 'notify-osd' 'libnotify' 'mobile-broadband-provider-info')
makedepends=('intltool' 'gnome-bluetooth')
optdepends=('gnome-bluetooth: for PAN/DUN support')
conflicts=('network-manager-applet')
options=('!libtool')
install=${_pkgname}.install
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/0.8/${_pkgname}-${pkgver}.tar.bz2 lp289466_always_show_tray_icon.patch lp295788_xfce_menu_entry.patch lp328572-dxteam-connect-text.patch lp330571_dxteam_wired_connect_text.patch lp330608_dxteam_gsm_connect_text.patch lp341684_device_sensitive_disconnect_notify.patch lp358526_generic_disconnected_notification_icon.patch lp460144_correctly_update_notification.patch lp337960_dxteam_notification_icon_names.diff lp337960_dxteam_notification_icon_names_part2-images.diff strict_enum_check.patch notify_without_statusicon.patch workaround-nm-applet-0.8.2-libnotify-0.7.patch) 

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  for p in ${srcdir}/*.patch ${srcdir}/*.diff; do
      patch -p1 < $p
  done

  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib/networkmanager \
      --disable-static \
      --disable-maintainer-mode
  make
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_pkgname}.schemas" --domain nm-applet ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
md5sums=('e35d3c391edca440c24032e05870c130'
         'd53803076796e06654e1299133d17afd'
         '46a3cf7f5b4ed5775b92c2c97255c9cd'
         '70c9ec45fed405d2bf3e8627206e8b76'
         '110dfeaef8e6a94ce5927f19e45623c7'
         'e3cbe31ff25cb3953a73021b2f181596'
         '7a84944c9df02d23f0b600b521cb8ecc'
         '98f6f36d83331fa3ca9e3073c095235a'
         '21c6815e5c50ce764988bb6199b6a1d0'
         '62e9a60e71201497b70ee327e6190c4f'
         '96c93ae3601019b0818f764fbc821bb4'
         '0eea810f01a7e4ebda7a464838cdd6c8'
         'eaaf925fb3d75b2d65e01ea2f680296d'
         'df8c783f7f9ea1902d8125e1debc47ab')
