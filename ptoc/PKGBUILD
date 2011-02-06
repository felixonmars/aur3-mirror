# Contributor: dkremer <david.kremer.dk@gmail.com>

pkgname=ptoc
pkgver=3.54
pkgrel=1
pkgdesc="ptoc : a pascal to c/c++ converter"

arch=('i686' 'x86_64')

url="http://www.garret.ru/pascal.html"
license=('shareware')
source=("http://www.garret.ru/ptoc-3.54.tar.gz")

md5sums=('eff1d3de2fd95c46b410ed300a8d49bc')

build() {
  cd $srcdir/$pkgname
  make all || return 1
}

package() {
  cd $srcdir/$pkgname
  mkdir $pkgdir/usr 
  mkdir $pkgdir/usr/bin 
  mkdir $pkgdir/usr/lib
  mkdir $pkgdir/etc
  make LOCALBASE=$pkgdir PREFIX=$pkgdir/usr install || return 1
}
