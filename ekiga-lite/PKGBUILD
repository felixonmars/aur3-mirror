# $Id: PKGBUILD 31413 2009-03-26 21:59:10Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

_name=ekiga
pkgname=${_name}-lite
pkgver=4.0.1
pkgrel=1
pkgdesc="Ekiga lite version (no evolution, gnome) - VOIP/Videoconferencing app (SIP and H.323 support)"
url="http://www.ekiga.org"
license=(GPL)
arch=(i686 x86_64)
depends=('opal>=3.10.2' 'ptlib>=2.10.2' 'libsigc++>=2.2.8' 'libxv' 'gtk2>=2.12.0' 'gstreamer0.10-base' 'perl' 'boost-libs')
makedepends=('pkgconfig' 'intltool' 'boost')
conflicts=('ekiga')
provides=('gnomemeeting')
replaces=('gnomemeeting')
options=(!emptydirs)
groups=('gnome-extra')
source=(http://ftp.gnome.org/pub/gnome/sources/${_name}/${pkgver%.*}/${_name}-${pkgver}.tar.xz)
sha256sums=('5f4f491c9496cf65ba057a9345d6bb0278f4eca07bcda5baeecf50bfcd9a4a3b')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var \
              --disable-schemas-install \
              --disable-avahi \
              --disable-dbus \
              --disable-eds \
              --disable-gconf \
              --disable-gdu \
              --disable-ldap \
              --disable-notify \
              --disable-scrollkeeper \
              --enable-gstreamer \
              || return 1
  #sed -i -e 's/-fno-exceptions//' lib/engine/components/opal/Makefile || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
