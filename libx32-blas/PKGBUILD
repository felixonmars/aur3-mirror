# $Id: PKGBUILD 130989 2011-07-09 12:22:58Z ronald $
# Upstream Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Jason Taylor <jftaylor21@gmail.com>
# Maintainer: Fantix King <fantix.king at gmail.com>

_basepkgname=blas
pkgname=libx32-blas
pkgver=3.4.1
pkgrel=1.1
url="http://www.netlib.org/blas"
makedepends=('gcc-fortran-multilib-x32')
depends=('libx32-gcc-libs' "${_basepkgname}=${pkgver}")
pkgdesc="Basic Linear Algebra Subprograms (x32 ABI)"
arch=('x86_64')
license=("custom")
source=(http://www.netlib.org/lapack/lapack-${pkgver}.tgz
        Makefile.blas
        LICENSE.blas)
sha1sums=('c115223ac1bac9ab971aae865d3e95442bc979bc'
          '6cf0b6cc9c04da219a7007b58660a233d825123f'
          '2491a151a37f0162b25fc4e4e9a8ac444b574a76')
	
build() {
  cd "${srcdir}/lapack-${pkgver}"
  cp -f "${srcdir}/Makefile.blas" BLAS/SRC/Makefile 
  cp -f INSTALL/make.inc.gfortran make.inc

  export FC='gfortran -mx32'

  pushd BLAS/SRC
  make clean
#  FFLAGS="${CFLAGS/-O?/-O0}" make dcabs1.o
  FFLAGS="${CFLAGS} -fPIC" CFLAGS="${CFLAGS} -fPIC" CXXFLAGS="${CXXFLAGS} -fPIC" make shared
  cp libblas.so.${pkgver} "${srcdir}/lapack-${pkgver}/"

  popd
  ln -s libblas.so.${pkgver} libblas.so

}

package_libx32-blas() {
  install -m755 -d "${pkgdir}/usr/libx32"
  install -m755 "${srcdir}/lapack-${pkgver}/libblas.so.${pkgver}" \
    "${pkgdir}/usr/libx32/"
  ln -sf libblas.so.${pkgver} "${pkgdir}/usr/libx32/libblas.so"
  ln -sf libblas.so.${pkgver} "${pkgdir}/usr/libx32/libblas.so.3"
  
  # install license
  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s ${_basepkgname} "${pkgdir}"/usr/share/licenses/${pkgname}
}

