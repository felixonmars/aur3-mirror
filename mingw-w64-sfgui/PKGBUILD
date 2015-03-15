pkgname=mingw-w64-sfgui
pkgver=0.2.0
pkgrel=1
pkgdesc="SFGUI (Simple and Fast Graphical User Interface), a C++ GUI library for SFML. (mingw-w64)"
arch=(any)
url="http://sfgui.sfml-dev.de"
license=("zlib")
makedepends=(mingw-w64-gcc mingw-w64-cmake sfml dos2unix)
depends=(mingw-w64-crt
"mingw-w64-sfml>=2.0")
options=(!libtool !strip !buildflags)
source=("SFGUI-$pkgver-source.zip::http://sfgui.sfml-dev.de/download/29")
md5sums=('d264e7e804a9d8e1c99bf3cdca29204b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/SFGUI-$pkgver"
  find . -type f -exec dos2unix {} \;
}

build() {
  cd "$srcdir/SFGUI-$pkgver"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake \
      -DSFML_SYSTEM_LIBRARY_RELEASE=/usr/${_arch}/lib/libsfml-system.a \
      -DSFML_WINDOW_LIBRARY_RELEASE=/usr/${_arch}/lib/libsfml-window.a \
      -DSFML_GRAPHICS_LIBRARY_RELEASE=/usr/${_arch}/lib/libsfml-graphics.a \
      -DSFGUI_BUILD_EXAMPLES=OFF \
      -DSFGUI_INCLUDE_FONT=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/SFGUI-$pkgver/build-$_arch"
    make DESTDIR=$pkgdir install
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm "$pkgdir/usr/${_arch}/"{AUTHORS,LICENSE,README}
  done
}
