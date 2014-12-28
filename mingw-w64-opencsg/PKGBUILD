
pkgname=mingw-w64-opencsg
pkgver=1.4.0
pkgrel=1
pkgdesc="Library for image-based CSG rendering using OpenGL. (mingw-w64)"
arch=('any')
license=('GPL2')
depends=('mingw-w64-glew' 'mingw-w64-freeglut')
makedepends=('mingw-w64-gcc')
options=('!buildflags' '!strip' 'staticlibs')
url="http://www.opencsg.org"
source=("http://www.opencsg.org/OpenCSG-${pkgver}.tar.gz")
sha1sums=('2c2592a9f625ec1c7a3d208403ea2ac1cae2f972')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"
  for _arch in ${_architectures}; do
    cp -r "OpenCSG-$pkgver" build-${_arch} && pushd build-${_arch}
    make sub-src-all CC=${_arch}-gcc CXX=${_arch}-g++ LINK=${_arch}-g++ \
      CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4" \
      CXXFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4" \
      LIBS="-lglew32 -lopengl32 -lgdi32" LFLAGS="-shared -Wl,--out-implib,libopencsg.dll.a" \
      INCPATH="-I. -I../include -I.." TARGET="libopencsg.dll"
    make -C src staticlib AR="${_arch}-ar cqs"
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    install -d "$pkgdir"/usr/${_arch}/{include,lib,bin}
    install -m755 lib/libopencsg.dll "$pkgdir"/usr/${_arch}/bin
    install -m644 src/libopencsg.dll.a "$pkgdir"/usr/${_arch}/lib
    install -m644 lib/libopencsg.a "$pkgdir"/usr/${_arch}/lib
    install -m644 include/opencsg.h "$pkgdir"/usr/${_arch}/include
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a  
  done
}

