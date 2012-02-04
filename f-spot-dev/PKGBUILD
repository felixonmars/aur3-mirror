# $Id: PKGBUILD 81066 2010-05-26 10:55:37Z jgc $
# Maintainer: Jean Levasseur <levasseur.jean@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <kritoke@nospam.gmail.com>

pkgname=f-spot-dev
_realpkgname=f-spot
pkgver=0.7.3
pkgrel=1
pkgdesc="A personal photo management program for GNOME"
groups=('gnome')
url="http://www.gnome.org/projects/${_realpkgname}/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mono>=2.6.4' 'gnome-sharp>=2.24.1' 'lcms>=1.18-3' 'libgphoto2>=2.4.9' 'ndesk-dbus-glib>=0.4.1' 'hicolor-icon-theme' 'mono-addins>=0.4'
         'gnome-keyring-sharp' 'libflickrnet')
makedepends=('intltool' 'gnome-doc-utils>=0.20.0' 'gnome-screensaver>=2.30.0')
conflicts=('f-spot' 'f-spot-git')
options=('!libtool' '!makeflags' '!emptydirs' '!strip')
install=${pkgname}.install
source=("http://ftp.gnome.org/pub/gnome/sources/${_realpkgname}/0.7/${_realpkgname}-${pkgver}.tar.bz2")
sha256sums=('07b61459c8c00f9ad83e3ec353995502cd08d6539f1b292edde7ef30929515e6')

build() {
  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"

  cd "${srcdir}/${_realpkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --disable-scrollkeeper || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" --domain f-spot ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
