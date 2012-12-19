# Maintainer: haru <uobikiemukot at gmail dot com>
pkgname=yaft-x
pkgver=0.2.3
pkgrel=0
pkgdesc="yaft x window system port"
arch=('i686' 'x86_64')
url="http://uobikiemukot.github.com/yaft"
license=('MIT')
makedepends=('ncurses')
source=($url/release/$pkgname-$pkgver.tar.gz)

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
md5sums=('d35d696c876c02bf560c0cc4264effe3')
