# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=adcd
pkgver=1.2
pkgrel=1
pkgdesc="Diminutive CD player with ncurses interface"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/adcd/adcd.html"
license=('GPL3')
depends=('ncurses')
source=(http://mirror.lihnidos.org/GNU/savannah/adcd/$pkgname-$pkgver.tar.lz)
md5sums=('00a57f34d299042ca72466dfb242bafa')

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
