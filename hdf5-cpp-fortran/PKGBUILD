# $Id$
# Maintainer: Sergey Astanin <s punto astanin chiocciola gmail punto com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

pkgname=hdf5-cpp-fortran
_srcpkgname=hdf5
pkgver=1.8.8
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="C, C++ and Fortran library bindings to work with HDF5 file format."
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('zlib' 'sh')
makedepends=('time' 'gcc-fortran')
provides='hdf5'
source=(http://www.hdfgroup.org/ftp/HDF5/releases/${_srcpkgname}-${pkgver}/src/${_srcpkgname}-${pkgver}.tar.bz2)
options=('!libtool')
sha1sums=('1bc16883ecd631840b70857bea637a06eb0155da')

build() {
  cd $srcdir/${_srcpkgname}-${pkgver}
  export CFLAGS="${CFLAGS/O2/O0}"
  export CXXFLAGS="${CFLAGS}"
  ./configure --prefix=/usr --disable-static \
    --enable-hl \
    --enable-cxx \
    --enable-fortran \
    --enable-linux-lfs \
    --enable-production \
    --with-pic \
    --docdir=/usr/share/doc/hdf5/ \
    --with-pthread=/usr/lib/ \
    --disable-sharedlib-rpath
  make
}

package() {
  cd $srcdir/${_srcpkgname}-${pkgver}

  make -j1 DESTDIR=${pkgdir} install

  install -d -m755 $pkgdir/usr/share/licenses/${pkgname}
  install -m644 $srcdir/${_srcpkgname}-${pkgver}/COPYING \
          $pkgdir/usr/share/licenses/${pkgname}/LICENSE 
}

