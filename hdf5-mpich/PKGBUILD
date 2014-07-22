# Contributor: Jed Brown <jed@59A2.org>
pkgname=hdf5-mpich
_pkgname=hdf5
_prefix=/opt/mpich
_mpirun=${_prefix}/bin/mpiexec
pkgver=1.8.12
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="General purpose library and file format for storing scientific data (MPICH version)"
url="http://hdfgroup.org/HDF5"
license=("custom")
#provides=(hdf5)
#conflicts=(hdf5)
depends=('zlib' 'sh' 'mpich')
replaces=(hdf5-mpich2)
makedepends=('time')
source=(ftp://ftp.hdfgroup.org/HDF5/current/src/${_pkgname}-${pkgver/_/-}.tar.gz)
md5sums=('d804802feb99b87fc668a90e6fa34411')
options=("!libtool")

build() {
  # As of 1.8.10, out-of-source builds are broken (Fortran modules)
  cd ${_pkgname}-${pkgver/_/-}
 
 unset CFLAGS
  unset CXXFLAGS
  ./configure \
         FC=${_prefix}/bin/mpif90 \
         F9X=${_prefix}/bin/mpif90 FFLAGS="-I${_prefix}/include" \
         CC=${_prefix}/bin/mpicc CXX=${_prefix}/bin/mpicxx \
         RUNSERIAL="${_mpirun} -n 1" RUNPARALLEL="${_mpirun} -n $$NPROCS" \
          --prefix=${_prefix} \
          --enable-parallel \
          --enable-hl \
          --enable-linux-lfs \
          --enable-production \
          --enable-fortran \
          --enable-shared \
          --with-pic \
          --docdir=${_prefix}/share/${_pkgname} \
          --with-pthread=/usr/lib
  make
}
package () {
  cd $srcdir/${_pkgname}-${pkgver/_/-}
  unset CFLAGS
  unset CXXFLAGS
  make -j1 prefix=${pkgdir}${_prefix} install

  install -D -m644 ${srcdir}/${_pkgname}-${pkgver/_/-}/COPYING \
          ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
