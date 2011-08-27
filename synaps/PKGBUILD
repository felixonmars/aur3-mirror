pkgname=synaps
pkgver=2.5.2
pkgrel=2
pkgdesc="SYNAPS is a library devoted to symbolic and numeric computations."
arch=('i686')
url="http://www-sop.inria.fr/galaad/logiciels/synaps/"
source=(http://gforge.inria.fr/frs/download.php/1526/$pkgname-$pkgver.tar.gz
        fixes.patch)
depends=('blas' 'lapack' 'gmp')
md5sums=('0f9e8db527f2cc68fbe33bd0ef37855e' 'addec095a6f3ac055207eef67c0bd99e')
license=('unknown')

build() {
  mv $startdir/src/$pkgname-$pkgver $startdir/src/main
  cd $startdir/src/main
  patch -p1 < ../fixes.patch
  ./configure --prefix /usr
  make
  DESTDIR=$startdir/pkg make install

}
