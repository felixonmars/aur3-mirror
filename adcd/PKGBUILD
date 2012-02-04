# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=adcd
pkgver=1.0
pkgrel=2
pkgdesc="Diminutive CD player with ncurses interface"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/adcd/adcd.html"
license=('GPL3')
depends=('ncurses')
source=(http://mirror.lihnidos.org/GNU/savannah/adcd/$pkgname-$pkgver.tar.gz)
md5sums=('b5adeaf7417d5c8483bc2a40e39e688c')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
