# Contributor: acmps <acmps.pt@gmail.com>

pkgname=crazytype
pkgver=0.2.3
pkgrel=1
pkgdesc="A different (and crazy) typing game."
arch=('i686' 'x86_64')
depends=('ncurses')
url="http://crazytype.sourceforge.net/"
license=('GPL')
source=(http://crazytype.googlecode.com/files/crazytype-0.2.3.tar.gz)
md5sums=('551c4bc7d63a75ae97eac4a6f5c58f2f')

build() {
  cd $srcdir/$pkgname
  make || return 1

  install -dv $pkgdir/var/games/crazytype
  install -dv $pkgdir/usr/share/crazytype
  install -dv $pkgdir/usr/bin
  install -m 755 demo/crazytype $pkgdir/usr/bin
  install -m 666 scores $pkgdir/var/games/crazytype
  cp -rf words $pkgdir/usr/share/crazytype
}
