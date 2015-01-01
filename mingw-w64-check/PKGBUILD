pkgname=mingw-w64-check
pkgver=0.9.14
pkgrel=1
pkgdesc="A unit testing framework for C (mingw-w64)"
arch=(any)
url="http://check.sourceforge.net/"
license=("LGPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(!strip !buildflags !docs staticlibs)
source=("http://downloads.sourceforge.net/project/check/check/${pkgver}/check-${pkgver}.tar.gz")
sha1sums=('4b79e2d485d014ddb438e322b64235347d57b0ff')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/check-${pkgver}" 
  for _arch in ${_architectures}; do
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd 
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/check-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/usr/${_arch}/share/"
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

