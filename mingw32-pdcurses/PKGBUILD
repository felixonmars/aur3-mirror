# Maintainer: et50292@gmail.com

pkgname=mingw32-pdcurses
pkgver=3.4
pkgrel=1
arch=(i686)
pkgdesc="An implementation of the curses library for Win32, DOS, OS/2, X11 and SDL."
makedepends=('mingw32-gcc' 'mingw32-binutils' 'mingw32-w32api')
url="http://pdcurses.sourceforge.net/"
license=(custom)
source=(http://downloads.sourceforge.net/pdcurses/PDCurses-$pkgver.tar.gz)
md5sums=('4e04e4412d1b1392a7f9a489b95b331a')
options=(!strip)

build()
{
  cd $srcdir/PDCurses-$pkgver/win32

  make -f ./gccwin32.mak CC=i486-mingw32-gcc LINK=i486-mingw32-gcc LIBEXE=i486-mingw32-ar || exit 1

  mkdir -p $pkgdir/usr/i486-mingw32/lib $pkgdir/usr/i486-mingw32/include

  install -m 644 panel.a $pkgdir/usr/i486-mingw32/lib/libpanel.a
  install -m 644 pdcurses.a $pkgdir/usr/i486-mingw32/lib/libpdcurses.a
  install -m 644 ../curses.h ../panel.h $pkgdir/usr/i486-mingw32/include
}
