# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=fastdb
pkgver=3.76
pkgrel=1
pkgdesc='Main Memory Relational Database Management System'
arch=('i686' 'x86_64')
url='http://www.garret.ru/fastdb.html'
license=('MIT')
source=(http://www.garret.ru/$pkgname-$pkgver.tar.gz)
md5sums=('08e7cc953880e77114fa437f8c97a2ec')

prepare() {
  cd $srcdir/$pkgname
   ./configure --prefix=/usr
}

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install
}