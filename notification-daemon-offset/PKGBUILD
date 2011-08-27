# $Id: PKGBUILD 63420 2010-01-17 13:58:02Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Mark Rosenstand <mark@borkware.net>

pkgname=notification-daemon-offset
_pkgname=notification-daemon
pkgver=0.4.0
pkgrel=3
pkgdesc="Notification daemon for the desktop notifications framework with offset patch"
arch=(i686 x86_64)
license=('GPL')
url="http://www.galago-project.org/specs/notification/"
depends=('libsexy>=0.1.11' 'libwnck>=2.28.0' 'gconf>=2.28.0' 'gstreamer0.10-base>=0.10.25' 'libnotify>=0.4.5' 'libglade>=2.6.4' 'hicolor-icon-theme')
groups=('gnome')
makedepends=('pkgconfig' 'intltool')
options=('!libtool' '!emptydirs')
conflicts=('notification-daemon')
provides=('notification-daemon=0.4')
install=notification-daemon.install
source=(http://www.galago-project.org/files/releases/source/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2 
        notification-daemon-offset.patch)
md5sums=('e61eff9782551d81045bb53e8a801d58'
         '8f6db86d2bc44af1f141ee8865ea3dba')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i "$srcdir/notification-daemon-offset.patch"

  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/notification-daemon-1.0 \
      --localstatedir=/var --disable-static || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install || return 1

  install -d -m755 "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_pkgname}.schemas" --domain notification-daemon ${pkgdir}/etc/gconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}
