pkgname=mingw-w64-stormlib
pkgver=9.00a
pkgrel=1
pkgdesc="A C/C++ API to read and write MPQ files with support for merged archives, patch MPQs and more. (mingw-w64)"
arch=(any)
url="http://www.zezula.net/en/mpq/stormlib.html"
license=("MIT")
makedepends=(mingw-w64-gcc mingw-w64-cmake)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
source=("https://github.com/stormlib/StormLib/archive/v$pkgver.tar.gz")
sha256sums=('5dfed7de3773fd68fc813af569b36c19b83dc3650826ca556fd04bc99832b8cc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/StormLib-$pkgver"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
			-DCMAKE_BUILD_TYPE=Release \
      -DWITH_STATIC=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/StormLib-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}
