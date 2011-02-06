# Maintainer: leepesjee <lpeschier at xs4all dot nl>
pkgname=cbflib
pkgver=0.7.9
pkgrel=1
pkgdesc="An ANSI C library for accessing Crystallographic Binary and Image-supporting Files"
arch=('i686' 'x86_64')
url="http://www.bernstein-plus-sons.com/software/CBF/"
depends=('gcc-fortran')
license=('GPL')
source=(http://www.bernstein-plus-sons.com/software/CBFlib_$pkgver.tar.gz)
md5sums=('b4577df6352228e7fb7b8403520e29ed')

build() {
  cd $srcdir/CBFlib_$pkgver
  sed -i 's|F90C = gfortran|F90C = gfortran -fno-range-check|' ./Makefile
  sed -i "s|INSTALLDIR  = \$(HOME)|INSTALLDIR  = ${pkgdir}/usr|" ./Makefile
  make all || return 1
  make install
# clean up the include folder
  chmod 755 $pkgdir/usr/include/cbflib -v
  rmdir $pkgdir/usr/include/cbflib_old -v
}
