# Contributor: thorsten w. <p@thorsten-wissmann.de>
pkgname=ctris
pkgver=0.42
pkgrel=1
pkgdesc="Tetris clone with colorized ncurses ui"
arch=('i686' 'x86_64')
url="http://www.hackl.dhs.org/ctetris/"
license=('GPL')
depends=('ncurses')
makedepends=( )
backup=( )
source=( http://www.hackl.dhs.org/data/download/download.php?file=ctris-$pkgver.tar.bz2)

md5sums=('035627486d5f767f0c818a17a97bbe0c')

build() {
  cd $srcdir/ctris-$pkgver
  make || return 1
  make BINDIR=$pkgdir/usr/bin/ DESTDIR=$pkgdir install || return 1
}
