# Contributor: Jed Brown <jed@59A2.org>
pkgname=hdf5-mpich2
_pkgname=hdf5
_prefix=/opt/mpich2
_mpirun=${_prefix}/bin/mpiexec
pkgver=1.8.9
_pkgver=1.8.9
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="General purpose library and file format for storing scientific data"
url="http://hdfgroup.org/HDF5"
license=("custom")
#provides=(hdf5)
#conflicts=(hdf5)
depends=('zlib' 'bash' 'mpich2' 'gcc-libs')
makedepends=('time')
source=(ftp://ftp.hdfgroup.org/HDF5/current/src/${_pkgname}-${_pkgver}.tar.gz)
md5sums=('d1266bb7416ef089400a15cc7c963218')
options=("!libtool")

build() {
  mkdir -p build && cd build
  unset CFLAGS
  unset CXXFLAGS
  ../${_pkgname}-${_pkgver}/configure \
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
  cd $srcdir/build
  unset CFLAGS
  unset CXXFLAGS
  make -j1 prefix=${pkgdir}${_prefix} install

  install -D -m644 ${srcdir}/${_pkgname}-${_pkgver}/COPYING \
          ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
