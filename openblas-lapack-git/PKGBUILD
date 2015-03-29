# Maintainer: all3fox <all3fox [at] gmail __DoT_ com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Jiaxi Hu <sftrytry _AT_ gmail _DOT_ com>
# Contributor: Giuseppe Borzi <gborzi _AT_ ieee _DOT_ org>

pkgname=openblas-lapack-git
_pkgname=OpenBLAS
pkgver=v0.2.14.r0.gd0c51c4
pkgrel=1
pkgdesc="Optimized BLAS library based on GotoBLAS2 1.13 BSD"
arch=('i686' 'x86_64')
url="http://xianyi.github.com/OpenBLAS/"
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'perl' 'gcc-fortran')
provides=('openblas' 'blas=3.5.0' 'lapack=3.5.0' 'cblas')
conflicts=('openblas' 'blas' 'lapack' 'cblas')
options=(!emptydirs)
source=("git+https://github.com/xianyi/OpenBLAS/#branch=master")

_config="USE_OPENMP=0 USE_THREAD=0 MAJOR_VERSION=3 NO_LAPACK=0"

build() {
  cd "${srcdir}/${_pkgname}"

  NPROC=`grep "physical id" /proc/cpuinfo|sort|uniq|wc -l`
  NCORE4PROC=`grep "cores" /proc/cpuinfo|sort|tail -n 1|sed -e 's/cpu cores.*: //'`
  let NCORE=NPROC*NCORE4PROC

  make ${_config} NUM_THREADS=$NCORE libs netlib shared
}

check() {
  cd "${srcdir}/${_pkgname}"

  make ${_config} tests
}

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"

  make ${_config} PREFIX="${pkgdir}/usr" install

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Remove reference to ${pkgdir}
  sed -i -e "s%${pkgdir}%%" "${pkgdir}/usr/lib/cmake/openblas/OpenBLASConfig.cmake"

  # Symlink to provide blas, cblas and lapack
  cd "${pkgdir}/usr/lib/"
  # BLAS
  ln -sf libopenblas.so libblas.so
  ln -sf libopenblas.so libblas.so.3
  ln -sf libopenblas.so libblas.so.3.5.0
  # CBLAS
  ln -sf libopenblas.so libcblas.so
  # LAPACK
  ln -sf libopenblas.so liblapack.so
  ln -sf libopenblas.so liblapack.so.3
  ln -sf libopenblas.so liblapack.so.3.5.0
  echo "HERE"
}

# vim:set ts=2 sw=2 et:
md5sums=('SKIP')
