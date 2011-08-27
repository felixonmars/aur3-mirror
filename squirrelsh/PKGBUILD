# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=squirrelsh
pkgver=1.2.3
pkgrel=2
pkgdesc="A cross-platform alternative shell based on Squirrel"
url="http://squirrelsh.sourceforge.net/"
license=("GPL")
arch=('i686')
depends=('pcre')
source=(http://downloads.sourceforge.net/project/squirrelsh/Squirrel%20Shell/1.2.3/squirrelsh-1.2.3-src.tar.bz2)
md5sums=('f158839e73f09ffe6ed2543e82d32cee')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr  
  make CXX="${CXX:-g++}" || return 1
  install -d $pkgdir/usr/bin
  install -c -m 0755 ./bin/squirrelsh $pkgdir/usr/bin
  install -d $pkgdir/usr/share/man/man1
  install -c -m 0644 ./doc/squirrelsh.1 $pkgdir/usr/share/man/man1
}
