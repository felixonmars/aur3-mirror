# Maintainer: AshtonBRSC <michael@ashtonbrsc.co.uk>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-panel-no-limit-places-menu
_pkgname=gnome-panel
pkgver=2.30.2
pkgrel=1
pkgdesc="The GNOME Panel without the 5 item limit for bookmarks and volumes in the Places dropdown menu"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org"
depends=('libwnck>=2.30.2' 'gnome-menus>=2.30.2' 'evolution-data-server>=2.30.2' 'gnome-desktop>=2.30.2' 'libgweather>=2.30.2' 'librsvg>=2.26.0' 'hicolor-icon-theme' 'libcanberra' 'libbonoboui>=2.24.2')
makedepends=('gnome-doc-utils>=0.20.0' 'pkg-config' 'intltool' 'networkmanager')
options=('!libtool' '!emptydirs')
conflicts=('gnome-panel')
provides=('gnome-panel')
replaces=('gnome-panel')
groups=('gnome')
install=gnome-panel.install
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/2.30/${_pkgname}-${pkgver}.tar.bz2 gnome-panel-2.30.2-no-limit-places-menu.patch)
sha256sums=('f0171c55ecdf4970f819cce66de0db99bbe43832e8a284ea0dd0c89d7d12e7b6' 'e92f5e33e0891781cb0062a572a95abee3daea31b02439ceb80d3c61e4862a66')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 < ${srcdir}/gnome-panel-2.30.2-no-limit-places-menu.patch
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gnome-panel \
      --disable-scrollkeeper
  make
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain gnome-panel-2.0 ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
