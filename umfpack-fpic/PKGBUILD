# Maintainer: Marco Maso demind@gmail.com 

pkgname=umfpack-fpic
pkgver=5.2.0
pkgrel=1
pkgdesc="A multifrontal direct solver for unsymmetric linear systems, compiled woith -fPIC option and optimized for your arch"
arch=('i686' 'x86_64')
url="http://www.cise.ufl.edu/research/sparse/umfpack"
license=('LGPL')
provides=('umfpack')
conflicts=('umfpack')
makedepends=('blas' 'lapack')
source=(http://www.cise.ufl.edu/research/sparse/umfpack/UMFPACK-$pkgver.tar.gz \
	http://www.cise.ufl.edu/research/sparse/UFconfig/current/UFconfig.tar.gz \
        http://www.cise.ufl.edu/research/sparse/amd/current/AMD.tar.gz \
	UFconfig.mk)
md5sums=()

build() {
  cd $startdir/src/UMFPACK
  cp ../UFconfig/xerbla .
  cp ../UFconfig.mk $startdir/src/UFconfig
  patch -p2 -i ../umfpack-4.1-nosyscalls.patch
  make library || return 1
  mkdir -p $startdir/pkg/usr/lib
  mkdir $startdir/pkg/usr/include
  cp $startdir/src/UMFPACK/Lib/libumfpack.a $startdir/pkg/usr/lib && \
  cp $startdir/src/UMFPACK/Include/*.h $startdir/pkg/usr/include && \
  cp $startdir/src/AMD/Lib/libamd.a $startdir/pkg/usr/lib && \
  cp $startdir/src/AMD/Include/*.h $startdir/pkg/usr/include && \
  install -m644 $startdir/src/UFconfig/UFconfig.h $startdir/pkg/usr/include || return 1
#
# Fix permissions
  cd $startdir/pkg/usr/include
  chmod oug+r *
  cd $startdir/pkg/usr/lib
  chmod oug+r *
}

