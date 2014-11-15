# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>

pkgname=mingw-w64-fltk
_basename=fltk
pkgver=1.3.3
pkgrel=1
pkgdesc="Graphical user interface toolkit (mingw-w64)"
arch=('any')
license=('custom:LGPL')
url="http://www.fltk.org/"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
source=(http://fltk.org/pub/$_basename/$pkgver/$_basename-$pkgver-source.tar.gz)
options=(!strip !buildflags staticlibs)
md5sums=('9ccdb0d19dc104b87179bd9fd10822e3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
build() {
  unset LDFLAGS

  for _arch in ${_architectures}; do
	  rm -rf "${srcdir}/${_basename}-${pkgver}/build-${_arch}"
	  mkdir "${srcdir}/${_basename}-${pkgver}/build-${_arch}"
      cd "${srcdir}/${_basename}-${pkgver}/build-${_arch}"
      ${_arch}-cmake -DTHREADS_PTHREAD_ARG=2 -DOPTION_BUILD_EXAMPLES=OFF -DOPTION_BUILD_SHARED_LIBS=ON ..
      make
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_basename}-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install

    rm -rf "${pkgdir}/usr/${_arch}/share"
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
  done
}
