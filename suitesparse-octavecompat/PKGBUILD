# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=suitesparse-octavecompat
pkgver=4.4.1
pkgrel=1
pkgdesc="A collection of sparse matrix libraries"
url="http://www.cise.ufl.edu/research/sparse/SuiteSparse/"
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('gcc-fortran')
conflicts=('suitesparse' 'umfpack')
provides=('suitesparse' 'umfpack')
license=('GPL')
options=('staticlibs')
source=(http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-4.4.1.tar.gz \
  suitesparse-sharedlibs.patch)
sha1sums=('c8fa39b117b3121839deddbd0e56bf366c8130de'
          '69374e7513cb20fa1e6875dfa4da1db2f3264588')

prepare() {
  cd "$srcdir"/SuiteSparse
  
#  patch -p1 < $srcdir/little_fixes.patch
  patch -p0 < $srcdir/suitesparse-sharedlibs.patch
}
  
build() {
   cd "$srcdir"/SuiteSparse
   export CFLAGS=" ${CFLAGS} -DNPARTITION"
   
   make -C SuiteSparse_config/xerbla
   make -C SuiteSparse_config 
   for _lib in AMD CAMD COLAMD BTF KLU LDL CCOLAMD UMFPACK CHOLMOD CXSparse SPQR; do
      make -C ${_lib} library
   done
}

package() {
   cd "${srcdir}"/SuiteSparse
   install -d "${pkgdir}"/usr/{lib,include}
   
   for _lib in SuiteSparse_config AMD CAMD COLAMD BTF KLU LDL \
	  CCOLAMD UMFPACK CHOLMOD CXSparse SPQR
   do
     install -Dm644 *.so.*.* $pkgdir/usr/lib
   done
   for _lib in AMD CAMD COLAMD BTF KLU LDL \
	  CCOLAMD UMFPACK CHOLMOD CXSparse SPQR
   do
     find $_lib/Include -name "*.h" -exec install -Dm644 {} $pkgdir/usr/include \;
     find $_lib/Include -name "*.hpp" -exec install -Dm644 {} $pkgdir/usr/include \;
   done
   install -m644 SuiteSparse_config/SuiteSparse_config.h \
	      $pkgdir/usr/include
}
