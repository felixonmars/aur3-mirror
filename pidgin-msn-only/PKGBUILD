# Contributor: Sebastian Benvenuti <sebastianbenvenuti@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=pidgin-msn-only
pkgver=2.10.4
pkgrel=1
pkgdesc="A light pidgin version: only msn protocol supported without tcl, tk, support."
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
depends=('startup-notification' 'nss' 'hicolor-icon-theme')
makedepends=('ca-certificates' 'perlxml' 'python2' 'intltool')
replaces=('gaim')
provides=('pidgin')
conflicts=('pidgin')
options=('!libtool')
install=pidgin-msn-only.install
source=(http://downloads.sourceforge.net/pidgin/pidgin-$pkgver.tar.bz2)
md5sums=('264f9ae89742b8ee168306b85d2fb51e')

build() {
  cd $srcdir/pidgin-$pkgver

  # Use python2
  sed -i 's/env python$/&2/' */plugins/*.py \
   libpurple/purple-{remote,notifications-example,url-handler}

  ./configure --prefix=/usr --sysconfdir=/etc \
    --disable-schemas-install \
    --disable-meanwhile \
    --disable-dbus --disable-nm \
    --disable-perl \
    --disable-gestures \
    --disable-consoleui \
    --disable-gnutls \
    --disable-doxygen \
    --disable-gtkspell --disable-vv\
    --disable-tcl --disable-tk \
    --disable-avahi \
    --disable-idn \
    --with-system-ssl-certs=/etc/ssl/certs \
    --with-python=/usr/bin/python2 \
    --with-dynamic-prpls=msn
  make 
}

package() {
  cd $srcdir/pidgin-$pkgver
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir/etc"
}
