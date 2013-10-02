# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=adcd
pkgver=1.1
pkgrel=2
pkgdesc="Diminutive CD player with ncurses interface"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/adcd/adcd.html"
license=('GPL3')
depends=('ncurses')
source=(http://mirror.lihnidos.org/GNU/savannah/adcd/$pkgname-$pkgver.tar.gz)
md5sums=('fd4d7b071507f9c45c1336291d003c49')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/$pkgname-$pkgver  
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
