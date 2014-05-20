
pkgname=mingw-w64-openjpeg2
pkgver=2.1.0
pkgrel=1
pkgdesc="An open source JPEG 2000 codec, version $pkgver (mingw-w64)"
arch=('any')
license=('BSD')
url="http://www.openjpeg.org"
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt' 'mingw-w64-zlib')
options=('!buildflags' '!strip' 'staticlibs')
source=(http://downloads.sourceforge.net/project/openjpeg.mirror/$pkgver/openjpeg-$pkgver.tar.gz)
md5sums=('f6419fcc233df84f9a81eb36633c6db6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/openjpeg-${pkgver}"
  for _arch in ${_architectures}; do                                                                                                                                                                                                         
    unset LDFLAGS
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=OFF \
      ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/openjpeg-${pkgver}/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    cd "$srcdir/openjpeg-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done


}
