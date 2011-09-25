# $Id$
# Maintainer: neocrust <neocrust@gmail.com>

pkgname=evolution-data-server-mod
_pkgname=evolution-data-server
pkgver=2.32.2
pkgrel=3
pkgdesc="Central location for addressbook and calendar storage in the GNOME Desktop. Updated for compatibility between Gnome 2 and krb5"
arch=('i686' 'x86_64')
depends=('libsoup' 'nss' 'libgnome-keyring' 'libgweather' 'libical' 'db' 'libgdata' 'krb5')
makedepends=('intltool' 'gperf')
options=('!libtool')
provides=('evolution-data-server')
replaces=('evolution-data-server')
conflicts=('evolution-data-server')
url="http://www.gnome.org"
license=('GPL')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/2.32/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('d22fcd9e6f1cee7b4b11a25ae3c3d19e6a454e4f09b983a954ff2d7640bf1c36')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --with-openldap=yes \
      --libexecdir=/usr/lib/evolution-data-server \
      --with-krb5=/usr --with-libdb=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
