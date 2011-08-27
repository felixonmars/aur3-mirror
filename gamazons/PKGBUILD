# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=gamazons
pkgver=0.83
pkgrel=1
pkgdesc="Abstract game of territory for two players, played on a 10x10 board."
arch=('i686' 'x86_64')
url="http://www.yorgalily.org/gamazons/"
license=('GPL2')
depends=('libgnomeui')
source=(http://www.yorgalily.org/gamazons/src/$pkgname-$pkgver.tar.gz)
md5sums=('33c2b373fd7fff25282eae56d5926a7a')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
