# $Id$
# Contributor: Vincenzo Russo <lordcenzin@yahoo.it>
pkgname=chessdb
pkgver=3.6.18
pkgrel=1
pkgdesc="Free chess database"
arch=('i686')
url="http://chessdb.sourceforge.net"
license=('GPL')
depends=(tk)
source=(http://dl.sourceforge.net/sourceforge/chessdb/ChessDB-$pkgver.tar.gz)
md5sums=('6aee2e4eca26576cbe6e63dc6b8d55db')

build() {
  cd $startdir/src/ChessDB-$pkgver
  ./configure BINDIR="/usr/bin" SHAREDIR="/usr/share/chessdb"
  make || return 1
  make DESTDIR=$startdir/pkg install
}
