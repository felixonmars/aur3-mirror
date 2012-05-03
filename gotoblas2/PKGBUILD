# Maintainer: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>
pkgname=gotoblas2
_pkgname=GotoBLAS2
pkgver=1.13
pkgrel=2
pkgdesc="The fastest implementations of the Basic Linear Algebra Subroutines"
arch=('i686' 'x86_64')
url="http://www.tacc.utexas.edu/tacc-projects/gotoblas2/"
license=('custom')
depends=('gcc-libs')
makedepends=('perl')
provides=('blas=3.2.2')
conflicts=('blas')
optdepends=('lapack4goto: trimmed down lapack library')
options=(!makeflags)
source=($_pkgname-$pkgver.tar.gz::http://www.tacc.utexas.edu/documents/13601/b58aeb8c-9d8d-4ec2-b5f1-5a5843b4d47b
        fixlink.patch)
md5sums=('9627e7bceb8ad29fb533e53418a6823b'
         '1c8229a2e8a515a99cd88937c5f84113')

build() {
  cd "$srcdir/$_pkgname"

  patch -Np1 -i "$srcdir/fixlink.patch"
  unset CFLAGS
  unset CXXFLAGS
  # add TARGET=NEHALEM to the make line if you have a recent Xeon
  # like this: make NO_CBLAS=1 NOFORTRAN=1 TARGET=NEHALEM
  make NO_CBLAS=1 NOFORTRAN=1
}

package() {
  cd "$srcdir/$_pkgname"

  install -dm755 $pkgdir/usr/include/goto2
  install -m644 *.h $pkgdir/usr/include/goto2
  install -Dm644 00TACC_Research_License.txt $pkgdir/usr/share/licenses/$pkgname/License.txt
  install -dm755 $pkgdir/usr/lib
  cp -d lib* $pkgdir/usr/lib
  ln -s libgoto2.so $pkgdir/usr/lib/libblas.so.3
  ln -s libgoto2.a $pkgdir/usr/lib/libblas.a
  ln -sf libblas.so.3 $pkgdir/usr/lib/libblas.so
}

# vim:set ts=2 sw=2 et:
