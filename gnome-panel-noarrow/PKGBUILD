# $Id$
# Maintainer: Phynix <phynix719 at gmail dot com>
# Original Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-panel-noarrow
pkgver=2.26.3
pkgrel=1
pkgdesc="The GNOME Panel without the menu arrow"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org"
depends=('libwnck>=2.26.2' 'gnome-menus>=2.26.2' 'evolution-data-server>=2.26.3' 'gnome-desktop>=2.26.3' 'libgweather>=2.26.2.1' 'librsvg>=2.26.0' 'policykit-gnome>=0.9.2' 'libgnomeui>=2.24.1')
makedepends=('gnome-doc-utils>=0.16.1' 'pkgconfig' 'intltool')
provides=('gnome-panel=2.26.3')
conflicts=('gnome-panel')
options=('!libtool' '!emptydirs')
groups=('gnome')
install=gnome-panel.install
source=(http://downloads.sourceforge.net/project/gnome-panel-noa/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('d5c1617902d823fcd6ea340f1caaac4a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --libexecdir=/usr/lib/gnome-panel \
	      --disable-network-manager \
	      --disable-scrollkeeper || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain gnome-panel-2.0 ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
