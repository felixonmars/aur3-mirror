# $Id: PKGBUILD 82 2009-07-17 19:56:55Z aaron $
# Maintainer: Calvin M <mutantturkey@gmail.com>

pkgname=jwm-snapshot
pkgver=2.0.1
pkgsnapshot=456
pkgrel=4
pkgdesc="A lightweight window manager for the X11 Window System-snapshot"
arch=('i686' 'x86_64')
url="http://joewing.net/programs/jwm/"
license=('GPL2')
depends=('libxmu' 'libxext' 'libpng' 'libx11' 'libxft' 'libjpeg>=7' 'libxpm' 'libxinerama')
backup=('etc/system.jwmrc')
source=(http://joewing.net/programs/jwm/snapshots/jwm-$pkgsnapshot.tar.bz2)
md5sums=('7366c6bc41a05a65de03436401cccdb1')

build() {
  cd "$srcdir/$pkgname-$pkgsnapshot"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-fribidi
  make || return 1
  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man" \
       SYSCONF="$pkgdir/etc" install || return 1
}
