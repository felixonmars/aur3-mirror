# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Berkus <berkus@madfire.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=othello
pkgver=1.9.4
pkgrel=4
pkgdesc="Reversi game implementation with very strong AI"
arch=('i686' 'x86_64')
url="http://www.icce.rug.nl/~hein/programs.shtml#othello"
license=('GPL')
depends=('allegro4' 'gcc-libs')
source=(http://www.icce.rug.nl/~hein/ftp/othello/$pkgname-$pkgver.tar.gz 
        resource-path.patch)
md5sums=('cd7d299b1db7bfb6bc3e00d796ee3f23'
         '18e65f31033ef6033d475c70437d532a')

build() {
  cd $srcdir/$pkgname
  patch -p0 < $srcdir/resource-path.patch
  make
}

package() {
  cd $srcdir/$pkgname
  install -d $pkgdir/usr/{bin,share/othello}
  install -D -m 755 othello "$pkgdir/usr/bin/othello"
  install -D -m 644 *.dat "$pkgdir/usr/share/othello/"
}
