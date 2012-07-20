# $Id$
# Maintainer: Fabio Lima <fheday@gmail.com>
pkgname=acml-cblas
pkgver=3.3.0
pkgrel=1
pkgdesc="C interface to the acml BLAS"
url="http://www.netlib.org/blas"
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc' 'acml-gfortran')
makedepends=('gcc')
conflicts=('cblas')
replaces=('cblas')
backup=()
install=create_links
source=(
  'http://www.netlib.org/blas/blast-forum/cblas.tgz' 
  'Makefile.in'
  'LICENSE'
  'create_links'
)
md5sums=('1e8830f622d2112239a4a8a83b84209a'
         '002b63eb44d5f300cd0c6d9eafe2c01b'
         '38b6acb8ed5691d25863319d30a8b365'
         'b3f4af7f7912f23ae85ec0e40d2022e5')

build() {
  cd $startdir/src/CBLAS

  /bin/cp $startdir/Makefile.in .

  install -d $startdir/src/CBLAS/src/lib

  install -d $startdir/pkg/usr/lib
  install -d $startdir/pkg/usr/include

  install -d $startdir/pkg/lib
  install -d $startdir/pkg/lib/acml

  make all || return 1

#  install -m755 $startdir/src/CBLAS/lib/* $startdir/pkg/usr/lib
  install -m644 $startdir/src/CBLAS/include/cblas.h $startdir/pkg/usr/include

  install -m755 $srcdir/CBLAS/lib/cblas_LINUX.a $startdir/pkg/lib/acml
  /bin/mv $startdir/pkg/lib/acml/cblas_LINUX.a $startdir/pkg/lib/acml/libcblas.a
#  ln -s $startdir/pkg/lib/acml/* $startdir/pkg/lib 


  install -m755 -d $startdir/pkg/usr/share/licenses/cblas
  install -m644 $startdir/LICENSE $startdir/pkg/usr/share/licenses/cblas/
}
