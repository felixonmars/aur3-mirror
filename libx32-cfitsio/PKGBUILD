# $Id: PKGBUILD 164644 2012-08-01 17:49:36Z andrea $
# Upstream Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

_basepkgname=cfitsio
pkgname=libx32-cfitsio
pkgver=3.310
pkgrel=1.1
pkgdesc="A library of C and Fortran subroutines for reading and writing data files in FITS (Flexible Image Transport System) data format (x32 ABI)"
arch=('x86_64')
url="http://heasarc.gsfc.nasa.gov/docs/software/fitsio/fitsio.html"
license=('custom')
depends=('libx32-glibc' "${_basepkgname}=${pkgver}")
makedepends=('gcc-multilib-x32')
options=('!libtool')
source=("ftp://heasarc.gsfc.nasa.gov/software/fitsio/c/${_basepkgname}${pkgver/./}.tar.gz")
md5sums=('75b6411751c7f308d45b281b7beb92d6')

build() {
  cd "${srcdir}"/${_basepkgname}
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/libx32
  make shared
}

check() {
  cd "${srcdir}"/${_basepkgname}
  make testprog
  LD_LIBRARY_PATH=. ./testprog > testprog.lis
  [[ -z $(diff testprog.lis testprog.out) ]] || return 1
  [[ -z $(cmp testprog.fit testprog.std) ]] || return 1
}

package() {
  cd "${srcdir}"/${_basepkgname}
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/include"

  # install license
  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s ${_basepkgname} "${pkgdir}"/usr/share/licenses/${pkgname}
}
