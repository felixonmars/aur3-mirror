# Contributor: Jed Brown <jed@59A2.org>
pkgname=hdf5-openmpi
_pkgname=hdf5
_prefix=/usr
_mpirun=${_prefix}/bin/mpiexec
pkgver=1.8.10
_pkgver=1.8.10
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="General purpose library and file format for storing scientific data"
url="http://hdfgroup.org/HDF5"
license=("custom")
provides=(hdf5)
conflicts=(hdf5)
depends=('zlib' 'bash' 'openmpi' 'gcc-libs')
makedepends=('time')
source=(ftp://ftp.hdfgroup.org/HDF5/current/src/${_pkgname}-${_pkgver}.tar.gz)
md5sums=('710aa9fb61a51d61a7e2c09bf0052157')
options=("!libtool")

build() {
  mkdir -p build && cd build
  unset CFLAGS
  unset CXXFLAGS
  ../${_pkgname}-${_pkgver}/configure	\
                   FC=${_prefix}/bin/mpif90 \
  		   CC=${_prefix}/bin/mpicc CXX=${_prefix}/bin/mpicxx \
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
