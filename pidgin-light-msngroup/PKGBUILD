# Contributor: Odites <odites@gmail.com>

pkgname=pidgin-light-msngroup
pkgver=2.5.4
pkgrel=1
pkgdesc="A light pidgin version: msn, jabber, irc supported protocols with a patch to use msngroups as in WLM, but without gstreamer, tcl, tk, xscreensaver support. "
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
depends=('startup-notification' 'gtkspell' 'nss' 'hicolor-icon-theme')
makedepends=('ca-certificates' 'perlxml' 'python' 'intltool')
replaces=('gaim')
provides=('pidgin' 'pidgin-light')
conflicts=('pidgin' 'pidgin-light')
options=('!libtool')
install=pidgin-light.install
source=(http://downloads.sourceforge.net/pidgin/pidgin-$pkgver.tar.bz2 
http://developer.pidgin.im/raw-attachment/ticket/3319/msn_group_name.patch)
md5sums=('295fe533288c821342b660b6fc83bc11' '86d469894a7aaf1b329633c28076f907')

build() {

cd "$srcdir/pidgin-$pkgver"

#Patch to use msngroup
patch -Np0 -i ../msn_group_name.patch && ./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install \
  --disable-meanwhile --disable-screensaver --disable-nm --disable-perl \
  --disable-gnutls --disable-doxygen --disable-tcl --disable-tk \
  --disable-gstreamer --disable-avahi --with-system-ssl-certs=/etc/ssl/certs || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1

  # Remove GConf schema file
  rm -rf "$pkgdir/etc" || return 1
}