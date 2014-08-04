# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=adcd
pkgver=1.3
pkgrel=1
pkgdesc="Diminutive CD player with ncurses interface"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/adcd/"
license=('GPL2')
depends=('ncurses')
source=(http://mirror.lihnidos.org/GNU/savannah/adcd/$pkgname-$pkgver.tar.lz)
md5sums=('589cc85a52c258fc4fb254c060b9924f')

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
