# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=adcd
pkgver=1.1rc1
realpkgver=1.1-rc1
pkgrel=1
pkgdesc="Diminutive CD player with ncurses interface"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/adcd/adcd.html"
license=('GPL3')
depends=('ncurses')
source=(http://mirror.lihnidos.org/GNU/savannah/adcd/$pkgname-$realpkgver.tar.gz)
md5sums=('f7de7d0a62565846a20b91bfafabf439')

build() {
  cd $srcdir/$pkgname-$realpkgver

  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
