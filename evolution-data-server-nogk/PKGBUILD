# $Id: PKGBUILD,v 1.38 2007/04/01 22:49:48 jgc Exp $
# Maintainer: Arjan Timmerman <arjan@archlinux.org>

pkgname=evolution-data-server-nogk
_pkgname=evolution-data-server
pkgver=1.10.1
pkgrel=2
pkgdesc="Evolution Data Server provides a central location for addressbook and calendar in the GNOME Desktop. Without support for gnome-keyring"
arch=(i686 x86_64)
depends=('libsoup>=2.2.100-2' 'nss>=3.11.5' 'libgnome>=2.18.0-2' 'libglade>=2.6.0' 'db4.1')
makedepends=('perlxml' 'pkgconfig')
provides=('evolution-data-server')
replaces=('evolution-data-server')
conflicts=('evolution-data-server')
options=('nolibtool')
url="http://www.gnome.org"
license=(GPL)
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/1.10/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('1175bf76756009975f684116e76638c3')

build() {
  [ -z "${GNOMEDIR}" ] && . /etc/profile.d/gnome.sh

  cd ${startdir}/src/${_pkgname}-${pkgver}
  # Look for correct DB, we want 4.1
  sed -e 's|DB_CFLAGS="-I$withval/include"|DB_CFLAGS="-I$withval/include/db4.1"|' \
    -e 's|DB_LIBS="-L$withval/lib -ldb"|DB_LIBS="-L$withval/lib -ldb-4.1"|' \
    -i configure
  ./configure --prefix=/usr --sysconfdir=/etc \
    --localstatedir=/var  --with-openldap=yes \
    --libexecdir=/usr/lib/evolution-data-server-1.2 \
    --with-krb5=/usr --disable-gnome-keyring \
    --with-libdb=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
