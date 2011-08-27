# $Id: PKGBUILD 44591 2009-07-02 20:09:33Z jgc $
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Mario Blättermann <mariobl@gnome.org>

pkgname=same-gnome
pkgver=2.26.3
pkgrel=1
pkgdesc="Puzzle game for GNOME"
arch=(i686 x86_64)
license=('GPL')
depends=('libsm' 'gconf>=2.26.0-2' 'guile>=1.8.6' 'librsvg>=2.26.0' 'filesystem>=0.8-3' 'desktop-file-utils' 'gstreamer0.10>=0.10.22' 'ggz-client-libs>=0.0.14.1')
makedepends=('pkgconfig' 'gnome-doc-utils>=0.16.0' 'intltool')
provides=('same-gnome')
conflicts=('gnome-games<=2.28')
options=('!emptydirs')
install=same-gnome.install
url="http://www.gnome.org"
groups=('gnome')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.26/gnome-games-${pkgver}.tar.bz2)
md5sums=('32c69a25671d8d23b19f234efcc177ca')


build() {
  cd "${srcdir}/gnome-games-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper \
              --with-scores-user=root --with-scores-group=games \
	      --with-games=same-gnome \
	      --with-sound=gstreamer --disable-tests || return 1
  make || return 1
  cd same-gnome
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1

  # Remove all scores, we generate them from postinstall
  rm -rf "${pkgdir}/var"

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain gnome-games ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas

}
