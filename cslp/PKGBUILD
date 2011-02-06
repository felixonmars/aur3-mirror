#Contributors: schtroumpfette <fpeterschmitt@voila.fr>
#              Bmauet <careil.baptiste@hotmail.com>

pkgname=cslp
_pkgname=CSLP
pkgver=1.5
pkgrel=3
pkgdesc="A C library for console application"
url="http://code.google.com/p/consoleplus/"
license="LGPL"
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('glibc')
source=("http://consoleplus.googlecode.com/files/${_pkgname}_${pkgver}_dev.tar.gz")

build() {
  cd $srcdir/${_pkgname}_${pkgver}_dev
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/include
  mkdir $pkgdir/usr/lib
  make
  make install DESTDIR=$pkgdir/usr
}
md5sums=('9df94cd235a85bfce59c38547036c673')

