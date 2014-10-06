# Contributor: Ronald van Haren <ronald.archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=suitesparse-solibs
pkgver=4.3.1
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
source=(http://www.cise.ufl.edu/research/sparse/SuiteSparse/SuiteSparse-$pkgver.tar.gz \
	    dynlink.patch.tar.gz::https://savannah.gnu.org/support/download.php?file_id=32218 \
	    little_fixes.patch)
sha1sums=('f7087d6178331d570c1ec811bbd17cbce70ce2f5'
          '6c957bdd85b2c1d3e6631f0dd5c1a9fa2195e7d0'
          '2e4a3d5fabdbb7a2887bb94a7ad8abced9835a15')

prepare() {
  cd "$srcdir"/SuiteSparse
  patch -p1 < $srcdir/little_fixes.patch
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
