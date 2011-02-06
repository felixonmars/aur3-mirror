# Contributor: acmps <acmps.pt@gmail.com>

pkgname=hangman2
pkgver=0.1
pkgrel=1
pkgdesc="Hangman over LAN."
arch=('i686' 'x86_64')
depends=('ncurses')
url="http://sourceforge.net/projects/hangman2/"
license=('GPL')
install=('hangman2.install')
source=(http://downloads.sourceforge.net/project/hangman2/hangman2/hangman2-0.1/hangman2-0.1.tar.gz)
md5sums=('7ce7495b92581c3e497933f752503296')

build() {
  cd $srcdir/$pkgname
  make || return 1

  mv hang1 hang-server
  mv hang2 hang-client
  install -dv $pkgdir/usr/bin
  install -m 755 hang-server $pkgdir/usr/bin
  install -m 755 hang-client $pkgdir/usr/bin
}
