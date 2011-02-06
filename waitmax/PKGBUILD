# Maintainer: Abakus <java5@arcor.de>
pkgname=waitmax
pkgver=1.1
pkgrel=1
pkgdesc="allow program to run at most a specified amount of time"
arch=('i686')
url="http://mathias-kettner.de/waitmax.html"
license=('GPL')
depends=()
source=(http://mathias-kettner.de/download/$pkgname-$pkgver.tar.gz)
md5sums=('7acadc3e9d8b46726b5b315f03e4770f')

build() {
    cd $startdir/src/$pkgname-$pkgver
    make || return 1
    make DESTDIR=$startdir/pkg install || return 1
   }
