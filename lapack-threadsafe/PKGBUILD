# $Id$

pkgbase=lapack-threadsafe
pkgname=('lapack-threadsafe' 'blas-threadsafe')
pkgver=3.5.0
pkgrel=1
url="http://www.netlib.org/lapack"
pkgdesc="A clone of [extra] lapack, but compiled to be thread-safe."
makedepends=('gcc-fortran' 'cmake')
depends=('gcc-libs')
arch=('i686' 'x86_64')
license=("custom")
source=(http://www.netlib.org/lapack/lapack-${pkgver}.tgz
        LICENSE.blas)
sha1sums=('5870081889bf5d15fd977993daab29cf3c5ea970'
          '2491a151a37f0162b25fc4e4e9a8ac444b574a76')

build() {
  cd "${srcdir}"

  install -d build
  cd build
  cmake ../lapack-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_Fortran_COMPILER=gfortran \
    -DCMAKE_Fortran_FLAGS=-frecursive \
    -DLAPACKE=ON
  make
}

package_lapack-threadsafe() {
  depends=("blas-threadsafe=${pkgver}")
  conflicts=('lapack')
  provides=("lapack=${pkgver}")

  install -m755 -d ${pkgdir}/usr/{lib,bin,include}
  
  for libname in liblapack libtmglib liblapacke; do
    install -m755 "${srcdir}/build/lib/${libname}.so" \
      "${pkgdir}/usr/lib/"
    ln -sf ${libname}.so "${pkgdir}/usr/lib/${libname}.so.${pkgver}"
    ln -sf ${libname}.so "${pkgdir}/usr/lib/${libname}.so.3"
  done
  
  install -m755 "${srcdir}"/build/bin/* "${pkgdir}/usr/bin"
  install -m644 "${srcdir}"/build/include/* "${pkgdir}/usr/include"
  install -m755 -d "${pkgdir}/usr/share/licenses/lapack"
  install -m644 "${srcdir}/lapack-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/lapack/"
}

package_blas-threadsafe() {
  pkgdesc="A clone of [extra] blas, but compiled to be thread-safe."
  conflicts=('blas')
  provides=("blas=${pkgver}")

  install -m755 -d "${pkgdir}/usr/lib"
  install -m755 "${srcdir}/build/lib/libblas.so" \
      "${pkgdir}/usr/lib/"
  ln -sf libblas.so "${pkgdir}/usr/lib/libblas.so.${pkgver}"
  ln -sf libblas.so "${pkgdir}/usr/lib/libblas.so.3"

  install -m755 -d "${pkgdir}/usr/share/licenses/blas"
  install -m644 "${srcdir}/LICENSE.blas" \
    "${pkgdir}/usr/share/licenses/blas/"
}

