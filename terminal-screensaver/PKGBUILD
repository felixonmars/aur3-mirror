# Contributor: totoloco <totoloco at gmail dot com>
pkgname=terminal-screensaver
pkgver=0.8.2
pkgrel=2
pkgdesc="Terminal ScreenSaver (or tss for short) is an attempt to clone and enhance FreeBSD's daemon saver."
arch=('i686' 'x86_64')
url="http://www.pulia.nu/tss/"
license=('GPL2')
depends=('ncurses')
conflicts=('tss')
makedepends=('gcc')
source=(ftp://ftp4.freebsd.org/pub/FreeBSD/distfiles/tss-$pkgver.tar.gz)
md5sums=('e4223283dd2d7cf564fb81b940c0bdc8')

build() {
  cd "$srcdir/tss-$pkgver"
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/etc/tss
  cp $srcdir/tss-$pkgver/tss $pkgdir/usr/bin
  cp $srcdir/tss-$pkgver/tss_art/* $pkgdir/etc/tss
}

# vim:set ts=2 sw=2 et:
