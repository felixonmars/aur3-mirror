# $Id: PKGBUILD 78708 2010-04-27 20:38:42Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-power-manager-smapi
realname=gnome-power-manager
pkgver=2.32.0
pkgrel=2
pkgdesc="gnome-power-manager with some BASIC tp_smapi battery control"
arch=(i686 x86_64)
url="http://www.gnome.org/projects/gnome-power-manager/"
license=('GPL')
depends=('libnotify>=0.7.1' 'libunique>=1.1.6' 'libcanberra>=0.25' 'hicolor-icon-theme' 'upower>=0.9.2' 'libgnome-keyring>=2.32.0' 'tp_smapi>=0.40')
makedepends=('intltool' 'pkgconfig' 'gnome-doc-utils>=0.20.1' 'gnome-panel>=2.32.0' 'hal' 'autoconf')
optdepends=('gnome-panel-bonobo: panel applets')
options=(!emptydirs)
install=gnome-power-manager.install
groups=(gnome-extra)
source=(http://ftp.gnome.org/pub/GNOME/sources/gnome-power-manager/2.32/${realname}-${pkgver}.tar.bz2
gnome-power-manager-2.32.0-libnotify-0.7.patch
gnome-power-manager-2.32.0.smapi.patch
60-smapi.rules)
sha256sums=('17fa301bf7e133285c0e054ae3be2b0f690c48f59b09f67e04d6ed339b330476'
			'50e2f726281805f2b1eb3fbce2e8aa7a4258de12a20bb09e57527235c82760d2'            
			'f3a8d2eaa0317737cc4ad3d59a028aef6b6f6ff49ffda3bfc011232823fb12ec'
            'd404f72da9eb969222845d13a12297bf3a04c54ca4c6e3de81655ebce3186872')
provides=gnome-power-manager
replaces=gnome-power-manager
conflicts=gnome-power-manager


build() {
  cd "${srcdir}/${realname}-${pkgver}"
  patch -Np0 -i "${srcdir}/gnome-power-manager-2.32.0-libnotify-0.7.patch"
  patch -Np1 < ../gnome-power-manager-2.32.0.smapi.patch
  autoreconf
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib/gnome-power-manager \
      --disable-scrollkeeper \
      --with-dbus-services=/usr/share/dbus-1/services \
      --enable-applets --enable-tp-smapi
  make
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${realname}.schemas" --domain gnome-power-manager ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas

  install -D -m644 ${startdir}/60-smapi.rules ${pkgdir}/etc/udev/rules.d/60-smapi.rules || return 1
}
