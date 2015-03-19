
pkgname=mingw-w64-glbinding
pkgver=1.0.5
pkgrel=1
pkgdesc="A generated C++ binding for the OpenGL API, generated using the gl.xml specification (mingw-w64)"
arch=('any')
url="https://github.com/hpicgs/glbinding"
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/hpicgs/glbinding/archive/v$pkgver.tar.gz")
sha256sums=('b27e39315596491fd62fb580ee61f8683b3b25a63d2133fe1bab11cc61f066f8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/glbinding-$pkgver"
  sed -i 's|set(INSTALL_ROOT      ".")|set\(INSTALL_ROOT "share/\${project}")|g' CMakeLists.txt
}

build() {
  cd glbinding-$pkgver
  # disable -g set by ${_arch}-cmake because of too high memory usage
  export CXXFLAGS="-O2 -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    cmake -DCMAKE_TOOLCHAIN_FILE=/usr/share/mingw/toolchain-${_arch}.cmake -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DOPTION_BUILD_STATIC=ON ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    cmake -DCMAKE_TOOLCHAIN_FILE=/usr/share/mingw/toolchain-${_arch}.cmake -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do  
    cd "$srcdir/glbinding-${pkgver}/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "$srcdir/glbinding-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
  install -Dm644 "$srcdir"/glbinding-${pkgver}/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

