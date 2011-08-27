# Contributor: SiD/sidious <miste78@web.de>
pkgname=sbcd
pkgver=0.5.3
pkgrel="1"
pkgdesc="Curses CD player with an Creative Play Utility (bundled with SB16) based interface."
url="http://sbcd.sourceforge.net/"
license="GPL"
depends=('ncurses' 'sdl')
arch=(i686)
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('77cdc58d89900b604212837c38bc6854')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
