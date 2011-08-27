# Maintainer: Chris Baker <baker.chris.3@gmail.com>

pkgname=svdlibc
pkgver=1.34
pkgrel=2
pkgdesc="C library and executable for computing singular value decompositions"
arch=('i686' 'x86_64')
url="http://tedlab.mit.edu/~dr/svdlibc/"
license=('custom')
source=(http://tedlab.mit.edu/~dr/SVDLIBC/$pkgname.tgz Makefile.patch)
md5sums=('0e1b3bc149f1da476fd81c58742b5ee9'
         'be5eac53cb69528adee9b3ed1c4eea24')
build() {
  mkdir -p $pkgdir/usr/bin || return 1
  mkdir -p $pkgdir/usr/lib/$pkgname || return 1

  patch -up1 -i ../Makefile.patch || return 1
  
  cd $srcdir/SVDLIBC
  make || return 1
  
  cp $srcdir/SVDLIBC/svd $pkgdir/usr/bin
  cp $srcdir/SVDLIBC/libsvd.a $pkgdir/usr/lib/$pkgname
}
