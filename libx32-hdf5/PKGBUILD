# $Id: PKGBUILD 147982 2012-01-29 11:25:36Z ronald $
# Upstream Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>
# Maintainer: Fantix King <fantix.king at gmail.com>

_basepkgname=hdf5
pkgname=libx32-hdf5
pkgver=1.8.8
pkgrel=1.2
arch=('x86_64')
pkgdesc="General purpose library and file format for storing scientific data (x32 ABI)"
url="http://www.hdfgroup.org/HDF5/"
license=('custom')
depends=('libx32-zlib' 'sh' "${_basepkgname}=${pkgver}")
makedepends=('time' 'gcc-multilib-x32')
source=(
    ftp://ftp.hdfgroup.org/HDF5/current/src/${_basepkgname}-${pkgver/_/-}.tar.bz2
    H5public-stub.h
)
options=('!libtool')
sha1sums=('1bc16883ecd631840b70857bea637a06eb0155da'
          '824a670d4343d4402b3867fef17ff5a7860bed21')

build() {
  cd $srcdir/${_basepkgname}-${pkgver/_/-}
  export CFLAGS="${CFLAGS/O2/O0}"
  export CXXFLAGS="${CFLAGS}"
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"
  ./configure --prefix=/usr --disable-static \
    --libdir=/usr/libx32 \
    --enable-hl \
    --enable-threadsafe \
    --enable-linux-lfs \
    --enable-production \
    --with-pic \
    --docdir=/usr/share/doc/hdf5/ \
    --with-pthread=/usr/lib/ \
    --disable-sharedlib-rpath
  make
}

package() {
  install="${pkgname}.install"

  cd $srcdir/${_basepkgname}-${pkgver/_/-}

  make -j1 DESTDIR=${pkgdir} install

  mv "${pkgdir}/usr/include/H5pubconf.h" "${pkgdir}/"
  mv "${pkgdir}/usr/include/H5public.h" "${pkgdir}/"
  rm -rf "${pkgdir}/usr/"{include,share,bin}
  install -Dm644 "${pkgdir}/H5pubconf.h" "${pkgdir}/usr/include/H5pubconf-x32.h"
  install -Dm644  "${pkgdir}/H5public.h" "${pkgdir}/usr/include/H5public-x32.h"
  sed -i 's/H5pubconf.h/H5pubconf-x32.h/' "${pkgdir}/usr/include/H5public-x32.h"
  install -Dm644 "${srcdir}/H5public-stub.h" "${pkgdir}/usr/include/H5public-stub.h"

  # install license
  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s ${_basepkgname} "${pkgdir}"/usr/share/licenses/${pkgname}
}

