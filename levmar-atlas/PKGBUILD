# Maintainer: Sandro Vitenti <sandro at isoftware dot com dot br>

libname=levmar
pkgname=levmar-atlas
pkgver=2.6
pkgrel=1
pkgdesc="Levenberg-Marquardt nonlinear least squares algorithms in C/C++"
arch=('i686' 'x86_64')
url="http://www.ics.forth.gr/~lourakis/levmar/"
license=('GPL')
depends=('gcc-fortran' 'atlas-lapack')
#optdepends=()
options=(staticlibs)
backup=()
provides=('levmar')
source=("http://www.ics.forth.gr/~lourakis/levmar/$libname-$pkgver.tgz")
md5sums=("16bc34efa1617219f241eef06427f13f")

build() {
  cd "$srcdir/$libname-$pkgver"
  make LAPACKLIBS='-L/usr/lib -llapack -lcblas -lf77blas -latlas -lgfortran' CFLAGS='-Wall -fPIC -O3'
}

package() {
  cd "$srcdir/$libname-$pkgver"
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/include"
  install -m 644 liblevmar.a "$pkgdir/usr/lib"
  install -m 644 levmar.h "$pkgdir/usr/include"
}
