# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Modified PKGBUILD to include patch by: Federico Stafforini <fstafforini@gmail.com>

pkgname=nautilus-xds-patch
pkgver=2.24.2
pkgrel=1
provides=nautilus
pkgdesc="The GNOME shell and file manager. With xds patch to allow drag and drop to list view."
arch=(i686 x86_64)
license=('GPL')
depends=('librsvg>=2.22.3' 'eel>=2.24.1' 'libbeagle>=0.3.5.1' 'libtracker>=0.6.6' 'libexif>=0.6.16' 'exempi>=2.0.1' 'gnome-icon-theme>=2.24.0' 'desktop-file-utils' 'gvfs>=1.0.3')
makedepends=('perlxml' 'pkgconfig' 'intltool')
url="http://bugzilla.gnome.org/show_bug.cgi?id=171655"
groups=('gnome')
options=('!libtool' '!emptydirs')
install=nautilus.install
source=(http://ftp.gnome.org/pub/gnome/sources/${provides}/2.24/${provides}-${pkgver}.tar.bz2 nautilus_xds.patch)
md5sums=('783e5f7be6391d6c46b4725e38af475a' 'f13440002b5c78608b3e1a21f07355f7')

build() {
  cd "${srcdir}/${provides}-${pkgver}"
  # Apply bugzilla patch: http://bugzilla.gnome.org/attachment.cgi?id=118657
  # This allows drag and drop to nautilus while in list view. See bugzilla page for details: http://bugzilla.gnome.org/show_bug.cgi?id=171655
  patch -p0 -i ../nautilus_xds.patch
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --disable-update-mimedb || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1
  
  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${provides}.schemas" ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}

