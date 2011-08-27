# $Id: PKGBUILD 4361 2008-07-06 19:20:37Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gattax
_origname=gnome-games
pkgver=2.16.3
pkgrel=1
pkgdesc="A game that was dropped from gnome-games in 2.18"
arch=(i686 x86_64)
license=('GPL')
depends=('libgnomeui>=2.16.3' 'guile>=1.8.4-2' 'librsvg>=2.16.3' 'filesystem>=0.8-3' 'desktop-file-utils' 'gnome-python-desktop>=2.16.3' 'libgnomeprintui>=2.16.3' 'gnome-games')
makedepends=('perlxml' 'pkgconfig' 'gnome-doc-utils>=0.12.2')
conflicts=('gnome-games<=2.16.3')
options=('!emptydirs')
install=gnome-games.install
url="http://www.gnome.org"
groups=('gnome-extra')
source=("http://ftp.gnome.org/pub/gnome/sources/${_origname}/2.16/${_origname}-${pkgver}.tar.bz2")
md5sums=('88baa9ab64b84bfcac2a1ba05f84d2f9')

build() {
#  patch ${srcdir}/${_origname}-${pkgver}/configure ${srcdir}/configure.patch||return 1
  cd ${startdir}/src/${_origname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper \
              --with-scores-user=root --with-scores-group=games \
	      --with-sound=gstreamer\
	      --enable-games=none,gataxx  || return 1
  make || return 1
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  # Remove all scores, we generate them from postinstall
  rm -rf ${startdir}/pkg/var

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -rf ${pkgdir}/usr/share/locale
}
