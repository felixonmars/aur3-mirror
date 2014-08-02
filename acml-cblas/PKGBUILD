# Maintainer: Fabio Lima <fheday@gmail.com>
# Maintainer: Rich Li <rich at dranek com>
pkgname=acml-cblas
pkgver=3.3.0
pkgrel=2
pkgdesc="C interface to the acml BLAS"
url="http://www.netlib.org/blas"
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc' 'acml-gfortran')
makedepends=('gcc')
conflicts=('cblas')
replaces=('cblas')
options=(staticlibs)
install=acml.install
source=(
  'http://www.netlib.org/blas/blast-forum/cblas.tgz' 
  'Makefile.in'
  'LICENSE'
  'acml.install'
)
md5sums=('1e8830f622d2112239a4a8a83b84209a'
         '3eb3fb626da713bd152584bfc0a00482'
         '38b6acb8ed5691d25863319d30a8b365'
         '4b1f7cb1262c8879d0a5617873ba01c2'
         )

build() {
  cd "$srcdir/CBLAS"
  cp "$srcdir/Makefile.in" .
  make all
}

check() {
  cd "$srcdir/CBLAS"
  make runtst
}

package() {
  cd "$srcdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/cblas/LICENSE"

  cd "$srcdir/CBLAS"
  install -D -m644 include/cblas.h "$pkgdir/usr/include/cblas.h"
  install -D -m755 lib/cblas_LINUX.a "$pkgdir/usr/lib/acml/libcblas.a"
}
