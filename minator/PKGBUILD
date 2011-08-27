# Author: Pave

pkgname=minator
pkgver=1
pkgrel=1
pkgdesc="Simple 'search mines' game"
arch=('any')
url="http://www.archlinux.fr/yaourt-en/"
license=(GPL)
depends=('qt')
source=(http://venne.cz/$pkgname-$pkgver.tar.gz)

build() { 
  cd $srcdir/$pkgname-$pkgver/
  qmake
  make || return 1

  # Install executable
  install -Dm755 minator $startdir/pkg/usr/bin/minator
}

md5sums=('3f53b7e9c257e98de28e5c99fead34e8')