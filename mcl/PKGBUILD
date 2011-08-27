# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>

pkgname=mcl
pkgver=0.53.00
pkgrel=1
pkgdesc="MUD Client for Unix"
arch=('i686')
url="http://www.andreasen.org/mcl/"
license=('GPL')
source=(http://www.andreasen.org/mcl/dist/mcl-$pkgver-src.tar.gz gcc4.patch)
md5sums=('db67b299d26d8856045df0277078c8ca' '5ef081887839fad7d5004f718362f60b')
install=

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i $srcdir/gcc4.patch || return 1

  ./configure --prefix=$pkgdir/usr || return 1
  make                             || return 1
  make install                     || return 1
}
