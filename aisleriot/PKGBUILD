# $Id: PKGBUILD 136888 2011-09-02 16:27:34Z heftig $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=aisleriot
pkgver=3.1.1
pkgrel=1
pkgdesc="Aisleroit Games for GNOME"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsm' 'gconf' 'guile' 'desktop-file-utils' 'libcanberra' 'clutter-gtk' 'hicolor-icon-theme' 'librsvg' 'seed' 'pygobject')
makedepends=('gnome-doc-utils' 'intltool' 'gobject-introspection')
options=('!emptydirs' '!libtool')
install=aisleriot.install
url="http://www.gnome.org"
groups=('gnome-extra')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('a0d66e5fb8956d10822946767c64baee975900a381391dcb5186800c94e60a8a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-scrollkeeper \
      --disable-static \
      --with-scores-user=root --with-scores-group=games \
      --enable-introspection=yes
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  # Remove all scores, we generate them from postinstall
  rm -rf "${pkgdir}/var"

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain gnome-games ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
