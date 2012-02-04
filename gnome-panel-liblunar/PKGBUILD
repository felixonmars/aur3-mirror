# Maintainer: Wu Xiaotian <yetist@gmail.com>

pkgname=gnome-panel-liblunar
_pkgname=gnome-panel
pkgver=2.26.3
pkgrel=1
pkgdesc="The GNOME Panel with lunar clock applet"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org"
depends=('libwnck>=2.26.2' 'gnome-menus>=2.26.2' 'evolution-data-server>=2.26.3' 'gnome-desktop>=2.26.3' 'libgweather>=2.26.2.1' 'librsvg>=2.26.0' 'policykit-gnome>=0.9.2' 'libgnomeui>=2.24.1' 'liblunar-gtk>=2.2.1')
makedepends=('gnome-doc-utils>=0.16.1' 'pkgconfig' 'intltool')
options=('!libtool' '!emptydirs')
conflicts=('gnome-panel')
provides=('gnome-panel')
replaces=('gnome-panel')
groups=('gnome')
install=gnome-panel.install
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/2.26/${_pkgname}-${pkgver}.tar.bz2
  gnome-panel-2.26.3-with-lunar-clock.patch)
md5sums=('38de69896976d57abb4f4720fef62fcf'
         'f595ff3a27d5b6880fdf33bd8e9722c6')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 < ${srcdir}/gnome-panel-2.26.3-with-lunar-clock.patch
  gnome-autogen.sh --enable-liblunar \
              --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --libexecdir=/usr/lib/gnome-panel \
	      --disable-network-manager \
	      --disable-scrollkeeper || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_pkgname}.schemas" --domain gnome-panel-2.0 ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
