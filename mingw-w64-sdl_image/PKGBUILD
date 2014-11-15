pkgname=mingw-w64-sdl_image
pkgver=1.2.12
pkgrel=8
pkgdesc="A simple library to load images of various formats as SDL surfaces (mingw-w64)"
arch=(any)
url="http://www.libsdl.org/projects/SDL_image"
license=("zlib")
depends=(mingw-w64-crt mingw-w64-sdl mingw-w64-libpng mingw-w64-libwebp mingw-w64-libjpeg-turbo mingw-w64-libtiff)
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("$url/release/SDL_image-$pkgver.tar.gz")
md5sums=('a0f9098ebe5400f0bdc9b62e60797ecb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/SDL_image-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-sdltest
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/SDL_image-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
