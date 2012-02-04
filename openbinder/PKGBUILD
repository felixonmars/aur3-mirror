# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=openbinder
pkgver=20051228
pkgrel=1
pkgdesc="An OS abstraction layer, parent of the Android Binder"
arch=('i686')
license=('MPL')
url=('http://www.angryredplanet.com/~hackbod/openbinder/docs/html/index.html')
#Alternative URL: http://en.wikipedia.org/wiki/OpenBinder
source=('http://www.angryredplanet.com/~hackbod/openbinder/openbinder-12-28-2005.tar.gz')
md5sums=('26d35f4aef22afca11931de76c1de245')

build() {
  rm -rf $srcdir/build
  cp -ar $srcdir/$pkgname $srcdir/build
  export TOP=$pkgdir
  cd $srcdir/build
  make
}




