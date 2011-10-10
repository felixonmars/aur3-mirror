# Contributor: Thomas Schreck <shrek@axolotlfarm.org>

pkgname=libredblack
pkgver=1.3
pkgrel=4
pkgdesc="RedBlack balance tree searching and sorting library"
url="http://sourceforge.net/projects/libredblack/"
arch=(i686 x86_64)
depends=('glibc')
makedepends=()
license=()
source=(http://downloads.sourceforge.net/project/libredblack/libredblack/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('2b3d5cf18b7c611febdd946411b1e9c7')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

