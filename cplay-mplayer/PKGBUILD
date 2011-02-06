# Contributor Murtuza Akhtari <inxsible at gmail dot com>

pkgname=cplay-mplayer
pkgver=1.49
pkgrel=1
pkgdesc="A curses audio player patched and customized for use with MPlayer."
arch=('i686' 'x86_64')
url="http://www.argafal.de/cgi-bin/index.pl?page=projcplay&nolog=0"
license=('GPL2')
depends=('ncurses' 'python' 'mplayer')
backup=('etc/cplayrc')
source=(http://omploader.org/vNHdqdg/cplay cplayrc)
md5sums=('cf111b26c3f3fb80df7ed6b1c11e1d64'
         '84c39b02f7215b01e4d93cba9fb4df4c')

build() {
  install -D -m755 cplay $startdir/pkg/usr/bin/cplay
  install -D -m644 cplayrc $startdir/pkg/etc/cplayrc
}
