# Contributor: Marco Maso <demind@gmail.com>

pkgname=suitesparse
_pkgname=SuiteSparse
pkgver=3.6.1
pkgrel=1
pkgdesc="A suite of sparse matrix packages"
url="http://www.cise.ufl.edu/research/sparse/SuiteSparse/"
arch=('i686' 'x86_64')
conflicts=('umfpack')
provides=('AMD' 'BTF' 'CAMD' 'CCOLAMD' 'COLAMD' 'CHOLMOD' 'CXSparse' 'KLU' 'LDL' 'umfpack')
depends=('intel-tbb' 'metis' 'blas' 'lapack')
makedepends=('gcc-fortran')
license=('GPL')
source=(http://www.cise.ufl.edu/research/sparse/SuiteSparse/$_pkgname-$pkgver.tar.gz include_path_metis.patch)

md5sums=('88a44890e8f61cdbb844a76b7259d876'
         '0ef10281bac44f36a04c6766afee1f48')

build() {

   cd "$srcdir/$_pkgname"
   patch -Np1 -i $srcdir/include_path_metis.patch

   cp UFconfig/UFconfig.mk .
   libs="AMD CAMD COLAMD BTF KLU LDL CCOLAMD UMFPACK CHOLMOD CXSparse SPQR"

   msg "Building SuiteSparse..."
   ( cd UFconfig/xerbla
   make CFLAGS="${CFLAGS} -fPIC" METIS_PATH="/usr/include/metis" \
   METIS="-lmetis" SPQR_CONFIG="-DTIMING -DHAVE_TBB" TBB="-ltbb" \
   RTLIB="-lrt" )
   ( cd UFconfig
   make CFLAGS="${CFLAGS} -fPIC" METIS_PATH="/usr/include/metis" \
   METIS="-lmetis" SPQR_CONFIG="-DTIMING -DHAVE_TBB" TBB="-ltbb" \
   RTLIB="-lrt" )
   for i in $libs; do
   ( cd $i
   make CFLAGS="${CFLAGS} -fPIC" METIS_PATH="/usr/include/metis" \
   METIS="-lmetis" SPQR_CONFIG="-DTIMING -DHAVE_TBB" TBB="-ltbb" \
   RTLIB="-lrt" library
   if [ -d Demo ]; then
   cd Demo
   make -j1 CFLAGS="${CFLAGS} -fPIC" METIS_PATH="/usr/include/metis" \
   METIS="-lmetis" SPQR_CONFIG="-DTIMING -DHAVE_TBB" TBB="-ltbb" \
   RTLIB="-lrt"
   fi
   )
   done

   rm -rf shared
   mkdir shared
   ld -shared -soname libufconfig.so.3 -o shared/libufconfig.so.3.6.0 --whole-archive UFconfig/libufconfig.a && ln -sf libufconfig.so.3.6.0 shared/libufconfig.so
   ld -shared -soname libamd.so.2 -o shared/libamd.so.2.2.2 --whole-archive AMD/Lib/libamd.a -L./shared -lufconfig && ln -sf libamd.so.2.2.2 shared/libamd.so
   ld -shared -soname libcamd.so.2 -o shared/libcamd.so.2.2.2 --whole-archive CAMD/Lib/libcamd.a -L./shared -lufconfig && ln -sf libcamd.so.2.2.2 shared/libcamd.so
   ld -shared -soname libcolamd.so.2 -o shared/libcolamd.so.2.7.3 --whole-archive COLAMD/Lib/libcolamd.a -L./shared -lufconfig && ln -sf libcolamd.so.2.7.3 shared/libcolamd.so
   ld -shared -soname libccolamd.so.2 -o shared/libccolamd.so.2.7.3 --whole-archive CCOLAMD/Lib/libccolamd.a -L./shared -lufconfig && ln -sf libccolamd.so.2.7.3 shared/libccolamd.so
   ld -shared -soname libbtf.so.1 -o shared/libbtf.so.1.1.2 --whole-archive BTF/Lib/libbtf.a -L./shared -lufconfig && ln -sf libbtf.so.1.1.2 shared/libbtf.so
   ld -shared -soname libldl.so.2 -o shared/libldl.so.2.0.3 --whole-archive LDL/Lib/libldl.a -L./shared -lufconfig && ln -sf libldl.so.2.0.3 shared/libldl.so
   ld -shared -soname libcholmod.so.1 -o shared/libcholmod.so.1.7.3 --whole-archive CHOLMOD/Lib/libcholmod.a -lblas -llapack -lmetis -L./shared -lamd -lcamd -lcolamd -lccolamd && ln -sf libcholmod.so.1.7.3 shared/libcholmod.so
   ld -shared -soname libspqr.so.1 -o shared/libspqr.so.1.2.1 --whole-archive SPQR/Lib/libspqr.a -lblas -llapack -ltbb -L./shared -lcholmod && ln -sf libspqr.so.1.2.1 shared/libspqr.so
   ld -shared -soname libcxsparse.so.2 -o shared/libcxsparse.so.2.2.5 --whole-archive CXSparse/Lib/libcxsparse.a -L./shared -lufconfig -lm -lgcc_s && ln -sf libcxsparse.so.2.2.5 shared/libcxsparse.so
   ld -shared -soname libklu.so.1 -o shared/libklu.so.1.1.2 --whole-archive KLU/Lib/libklu.a -L./shared -lamd -lcolamd -lbtf && ln -sf libklu.so.1.1.2 shared/libklu.so
   ld -shared -soname libumfpack.so.5 -o shared/libumfpack.so.5.5.1 --whole-archive UMFPACK/Lib/libumfpack.a -lblas -llapack -L./shared -lcholmod -lamd && ln -sf libumfpack.so.5.5.1 shared/libumfpack.so
   }


package() {
cd $srcdir/$_pkgname
mkdir -p $pkgdir/usr/{lib,include}

cp -d shared/*.so* $pkgdir/usr/lib
ldconfig -n $pkgdir/usr/lib
libs="UFconfig AMD CAMD COLAMD BTF KLU LDL CCOLAMD UMFPACK CHOLMOD CXSparse SPQR"
for i in $libs; do
( cd $i
make INSTALL_LIB=$pkgdir/usr/lib INSTALL_INCLUDE=$pkgdir/usr/include \
METIS_PATH="/usr/include/metis" METIS="-lmetis" install
)
done
find $pkgdir -type f -exec chmod 644 {} + # Suitesparse must use cp instead of install, it gets the permissions wrong

install -d $pkgdir/usr/share/doc/$pkgname
install -m644 AMD/Doc/AMD_UserGuide.pdf CAMD/Doc/CAMD_UserGuide.pdf KLU/Doc/KLU_UserGuide.pdf KLU/Doc/palamadai_e.pdf LDL/Doc/ldl_userguide.pdf SPQR/Doc/spqr_user_guide.pdf $pkgdir/usr/share/doc/$pkgname
install -m644 -T CHOLMOD/Doc/UserGuide.pdf $pkgdir/usr/share/doc/$pkgname/CHOLMOD_UserGuide.pdf
install -m644 -T UMFPACK/Doc/UserGuide.pdf $pkgdir/usr/share/doc/$pkgname/UMFPACK_UserGuide.pdf
install -m644 -T UMFPACK/Doc/QuickStart.pdf $pkgdir/usr/share/doc/$pkgname/UMFPACK_QuickStart.pdf
}
