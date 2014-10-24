pkgname=mingw-w64-aquila
pkgver=3.0
pkgrel=1
pkgdesc="A Digital Signal Processing library written in C++ (mingw-w64)"
arch=('any')
url="http://aquila-dsp.org/"
license=('MIT')
depends=('mingw-w64-crt' 'mingw-w64-sfml')
makedepends=('git' 'mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=(aquila-${pkgver}::git+git://github.com/zsiciarz/aquila.git)
md5sums=('SKIP') 
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/aquila-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=OFF \
      -DAquila_BUILD_EXAMPLES=OFF \
      -DAquila_BUILD_TESTS=OFF \
      ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DAquila_BUILD_EXAMPLES=OFF \
      -DAquila_BUILD_TESTS=OFF \
      ..
    make
    popd
  done

}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/aquila-${pkgver}/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    cd "$srcdir/aquila-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
