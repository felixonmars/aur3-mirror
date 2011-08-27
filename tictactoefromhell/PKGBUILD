# Maintainer: Simone Tobia <simone.tobia@gmail.com>

pkgname=tictactoefromhell
pkgver=3.3.0
pkgrel=1
pkgdesc="TicTacToe game with QT4 animated graphics simulating hand drawing and many game variants. Now with networked mode."
arch=('i686' 'x86_64')
url="http://tttfh.sourceforge.net/"
license=('GPL2')
depends=('qt')
source=(http://downloads.sourceforge.net/project/tttfh/tttfh/$pkgver/tttfh-$pkgver-sources.tar.gz)
md5sums=('d14a71a20b0d2666fae743711c9a3a17')

build() {
  cd $srcdir/tttfh-$pkgver-sources
  lrelease *.ts
  qmake PREFIX=/usr
  make || return 1
  make INSTALL_ROOT="$pkgdir/" install
}
