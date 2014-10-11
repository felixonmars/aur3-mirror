
pkgname=mingw-w64-libvidstab
pkgver=0.98b
pkgrel=1
pkgdesc="Transcode video stabilization plugin (mingw-w64)"
arch=('any')
url="http://public.hronopik.de/vid.stab/"
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('git' 'mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
sha1sums=('SKIP')
source=(https://github.com/georgmartius/vid.stab/archive/release-${pkgver}.tar.gz)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/vid.stab-release-${pkgver}"
  sed -i "15ioption(BUILD_SHARED_LIBS \"\" ON)" CMakeLists.txt
  sed -i "s|add_library (vidstab SHARED|add_library (vidstab|g" CMakeLists.txt
}

build() {
  cd "$srcdir/vid.stab-release-${pkgver}"
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
    cd "$srcdir/vid.stab-release-${pkgver}/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    cd "$srcdir/vid.stab-release-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

