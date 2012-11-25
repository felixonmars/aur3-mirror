# $Id: PKGBUILD 171530 2012-11-18 12:48:02Z ronald $
# Upstream Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Jason Taylor <jftaylor21@gmail.com>
# Maintainer: Fantix King <fantix.king at gmail.com>

_basepkgname=lapack
pkgbase=libx32-lapack
pkgname=libx32-lapack
true && pkgname=('libx32-lapack' 'libx32-blas')
pkgver=3.4.2
pkgrel=1.1
url="http://www.netlib.org/lapack"
pkgdesc="Linear Algebra PACKage (x32 ABI)"
makedepends=('gcc-fortran-multilib-x32' 'cmake')
depends=("gcc-libs-multilib-x32")
arch=('x86_64')
license=("custom")
source=(http://www.netlib.org/${_basepkgname}/${_basepkgname}-${pkgver}.tgz
        LICENSE.blas) 
sha1sums=('93a6e4e6639aaf00571d53a580ddc415416e868b'
          '2491a151a37f0162b25fc4e4e9a8ac444b574a76')

build() {
  cd "${srcdir}"

  install -d build
  cd build
  cmake ../${_basepkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_Fortran_COMPILER=gfortran \
    -DCMAKE_Fortran_FLAGS_RELEASE='-mx32'
  make
}

package_libx32-lapack() {
  depends=("libx32-blas=${pkgver}")

  install -m755 -d ${pkgdir}/usr/{libx32,bin}
  
  for libname in liblapack libtmglib; do
    install -m755 "${srcdir}/build/lib/${libname}.so" \
      "${pkgdir}/usr/libx32/"
    ln -sf liblapack.so "${pkgdir}/usr/libx32/${libname}.so.${pkgver}"
    ln -sf liblapack.so "${pkgdir}/usr/libx32/${libname}.so.3"
  done
  
  for script in ${srcdir}/build/bin/*; do
    install -m755 "${script}" "${pkgdir}/usr/bin/$(basename ${script})-x32"
  done

  # install license
  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s lapack "${pkgdir}"/usr/share/licenses/libx32-lapack
}

package_libx32-blas() {
  pkgdesc="Basic Linear Algebra Subprograms (x32 ABI)"

  install -m755 -d "${pkgdir}/usr/libx32"
  install -m755 "${srcdir}/build/lib/libblas.so" \
      "${pkgdir}/usr/libx32/"
  ln -sf libblas.so "${pkgdir}/usr/libx32/libblas.so.${pkgver}"
  ln -sf libblas.so "${pkgdir}/usr/libx32/libblas.so.3"

  # install license
  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s blas "${pkgdir}"/usr/share/licenses/libx32-blas
}

