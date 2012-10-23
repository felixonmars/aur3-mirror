# $Id: PKGBUILD 164372 2012-07-31 19:53:01Z ronald $
# Upstream Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

_basepkgname=netcdf
pkgname=libx32-netcdf
pkgver=4.2.1
pkgrel=1.1
pkgdesc="network Common Data Form interface for array-oriented data access and corresponding library (x32 ABI)"
arch=("x86_64")
url="http://www.unidata.ucar.edu/downloads/netcdf/index.jsp"
depends=('libx32-gcc-libs' 'libx32-hdf5' 'libx32-curl')
#optdepends=('netcdf-fortran: fortran bindings' 'netcdf-cxx: c++ bindings')
options=('!libtool' '!makeflags')
license=('custom')
source=(http://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-${pkgver}.tar.gz)
sha1sums=('dfb6b10ef8dd20e785efa5e29b448383090f144d')

build() {
  cd ${srcdir}/${_basepkgname}-${pkgver}
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"
  #export CFLAGS="${CFLAGS} --include=/usr/include/H5public-x32.h"
  ./configure --prefix=/usr --libdir=/usr/libx32 --enable-shared --enable-netcdf-4 --enable-dap-netcdf
  make
#  make check
}

package() {
  cd ${srcdir}/${_basepkgname}-${pkgver}

  install -m755 -d ${pkgdir}/usr/lib
  install -m755 -d ${pkgdir}/usr/share/man
  make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}/usr/"{bin,include,lib,share}

  # install license
  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s ${_basepkgname} "${pkgdir}"/usr/share/licenses/${pkgname}
}
