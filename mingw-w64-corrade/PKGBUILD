pkgname=mingw-w64-corrade
pkgver=0.2
pkgrel=1
pkgdesc="Multiplatform plugin management and utility library (mingw-w64)"
arch=(any)
url="https://github.com/mosra/corrade"
license=("LGPLv3")
makedepends=(mingw-w64-gcc cmake)
depends=(mingw-w64-crt)
conflicts=(mingw-w64-taglib-static)
provides=(mingw-w64-taglib-static)
options=(!libtool !strip !buildflags)
source=("https://github.com/mosra/${pkgname#mingw-w64-}/tarball/v${pkgver}/${pkgname#mingw-w64-}-${pkgver}.tar.gz"
"Toolchain-i686-w64-mingw32.cmake"
"Toolchain-x86_64-w64-mingw32.cmake")
md5sums=('d0859887f9abbaa836663965d4a521e4'
         'da10ad00a161800e0b011a77c3efbf76'
         'adea9ccdeea1784c7cd30af195f2a8cb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/mosra-${pkgname#mingw-w64-}-87ac3ee"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir "build-${_arch}" && pushd "build-${_arch}"
    PATH="/usr/${_arch}/bin:$PATH" cmake \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr/${_arch} \
      -DCMAKE_TOOLCHAIN_FILE=${srcdir}/Toolchain-${_arch}.cmake \
      ..
    make
    popd
  done
}

package() {

  for _arch in ${_architectures}; do
    cd "$srcdir/mosra-${pkgname#mingw-w64-}-87ac3ee/build-${_arch}"
    make DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir/usr/$_arch/bin"
    mv "$pkgdir/usr/$_arch/lib/"*.dll "$pkgdir/usr/$_arch/bin"
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}