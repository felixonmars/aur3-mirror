#Maintainer: DanimanX <danimanx@gmail.com>
pkgname=latt
pkgver=1
pkgrel=0
pkgdesc="Simple latency tester that combines multiple processes."
url="http://brick.kernel.dk"
license=('(C) Jens Axboe <jens.axboe@oracle.com> 2009')
arch=(i686 x86_64)
source=(http://brick.kernel.dk/snaps/$pkgname-git-latest.tar.gz)
md5sums='41b3220207f802e837e3a6451f833fe9'

build() {
  cd "$srcdir/$pkgname"
  make
  
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/bin/"
  cp latt "$pkgdir/usr/bin/"
}



