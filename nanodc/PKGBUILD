# Contributor: Johannes Sjolund <j.sjolund AT gmail.com>

pkgname=nanodc
pkgver=0.3.3
pkgrel=4
pkgdesc="Ncurses DC++ client"
arch=('i686' 'x86_64')
url="http://nanodc.sourceforge.net/"
license="GPL"
depends=('bzip2' 'zlib' 'libsigc++2.0' 'glib2')
makedepends=('scons')
source=(http://dl.sourceforge.net/sourceforge/nanodc/$pkgname-$pkgver.tar.gz)
md5sums=('4633644a146d567593e3b21117bf39d6')


build() {

  cd $startdir/src/$pkgname-0.3/trunk/src

  sed -e "s|ncursesw/ncurses.h|ncurses.h|g" -i SConstruct
  sed -e "s|ncursesw/ncurses.h|ncurses.h|g" -i display/curses_window.h
  sed -e "s|ncursesw/ncurses.h|ncurses.h|g" -i input/input.h
  sed -e "s|ncursesw/ncurses.h|ncurses.h|g" -i input/manager.h
  sed -e "s|ncursesw/ncurses.h|ncurses.h|g" -i input/text_input.cc
  sed -e "s|ncursesw/ncurses.h|ncurses.h|g" -i commands/parameter.h

  scons || return 1

  install -D -m755 nanodc $startdir/pkg/usr/bin/nanodc

}
