# $Id: PKGBUILD 112791 2011-03-06 21:31:20Z ibiru $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-power-manager-notify-osd
_pkgname=gnome-power-manager
pkgver=2.32.0
pkgrel=2
pkgdesc="Session daemon that makes it easy to manage your laptop or desktop system."
arch=(i686 x86_64)
url="http://www.gnome.org/projects/gnome-power-manager/"
license=('GPL')
depends=('libnotify>=0.7.1' 'libunique>=1.1.6' 'libcanberra>=0.25' 'hicolor-icon-theme' 'upower>=0.9.5' 'libgnome-keyring>=2.31.92')
makedepends=('intltool' 'pkgconfig' 'gnome-doc-utils>=0.20.1' 'gnome-panel-bonobo>=2.31.92' 'gnome-common')
optdepends=('gnome-panel-bonobo: panel applets')
options=(!emptydirs)
install=gnome-power-manager.install
groups=(gnome-extra)
source=(http://ftp.gnome.org/pub/GNOME/sources/gnome-power-manager/2.32/${_pkgname}-${pkgver}.tar.bz2
        gnome-power-manager-2.32.0-libnotify-0.7.patch
        00git-devices-changed-signal.patch
        02-notify-osd-support.patch)
sha256sums=('17fa301bf7e133285c0e054ae3be2b0f690c48f59b09f67e04d6ed339b330476'
            '6a4a6d1a46bc209e55bb47ac1e626e35a4dcff2576c888a31f188c49ea1d4d94'
            'c106932d7a62addab58fc04086d71f86e06133ca5e5405e47e6751f1f7d79981'
            '7a112ed5c4da492dedc641c07631f6804ebdb3c4dacefb4fe5a7cee091b78c5e')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i "$srcdir/gnome-power-manager-2.32.0-libnotify-0.7.patch"
  patch -Np1 -i "$srcdir/00git-devices-changed-signal.patch"
  patch -Np1 -i "$srcdir/02-notify-osd-support.patch"

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib/gnome-power-manager \
      --disable-scrollkeeper \
      --with-dbus-services=/usr/share/dbus-1/services \
      --enable-applets
  make
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_pkgname}.schemas" --domain gnome-power-manager ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
