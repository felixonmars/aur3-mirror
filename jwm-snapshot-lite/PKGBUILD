# $Id: PKGBUILD 82 2009-09-09 12:26:26 $
# Maintainer: Calvin M <mutantturkey@gmail.com>

pkgname=jwm-snapshot-lite
pkgver=2.0.1
_pkgsnapshot=456
pkgrel=4
pkgdesc="A lightweight window manager for the X11 Window System | lite snapshot"
arch=('i686' 'x86_64')
url="http://joewing.net/programs/jwm/"
license=('GPL2')
depends=('libx11')
backup=('etc/system.jwmrc')
source=(http://joewing.net/programs/jwm/snapshots/jwm-$_pkgsnapshot.tar.bz2)
md5sums=('7366c6bc41a05a65de03436401cccdb1')

build() {
  cd "$srcdir/jwm-$_pkgsnapshot"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-fribidi --disable-shape --disable-png --disable-jpeg --disable-icons --disable-xmu --disable-xft --disable-confirm --disable-xrender --disable-xpm --disable-xinerama
  make || return 1
  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man" \
       SYSCONF="$pkgdir/etc" install || return 1
}
