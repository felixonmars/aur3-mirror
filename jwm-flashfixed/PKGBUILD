# Maintainer: insm <gminsm@gmail.com>

pkgname=jwm-flashfixed
pkgver=492
pkgrel=1
pkgdesc="Fixed FlashVideo Fullscreen Problem Version | A lightweight window manager for the X11 Window System"
arch=('i686' 'x86_64')
url="http://joewing.net/programs/jwm/"
license=('GPL2')
depends=('libx11' 'libxft' 'libjpeg>=7' 'libxpm' 'libxinerama' 'libpng')
backup=('etc/system.jwmrc')
source=(http://joewing.net/programs/jwm/snapshots/jwm-$pkgver.tar.bz2)
md5sums=('04594fddbf40d7b19c86c39078803a38')

build() {
  cd "$srcdir/jwm-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --disable-fribidi 
  make || return 1
  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man" \
       SYSCONF="$pkgdir/etc" install || return 1
}
