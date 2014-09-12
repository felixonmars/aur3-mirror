
pkgname=mingw-w64-clanlib
pkgver=3.0.1
pkgrel=1
pkgdesc="A multi-platform game development library (mingw-w64)"
arch=('any')
url="http://clanlib.org/"
license=('zlib')
depends=('mingw-w64-crt' 'mingw-w64-libjpeg-turbo' 'mingw-w64-libmikmod' 'mingw-w64-libpng' 'mingw-w64-libvorbis' 'mingw-w64-sdl_gfx' 'mingw-w64-freetype' 'mingw-w64-sqlite')
makedepends=('mingw-w64-gcc')
options=('staticlibs' '!buildflags' '!strip')
source=(http://www.clanlib.org/download/releases-3.0/ClanLib-${pkgver}.tgz)
md5sums=('29f2ce542019c6d5d8793cdf4811e4f9')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/ClanLib-${pkgver}
  sed -i "s|= min(|= std::min((int)|g" Sources/Core/ErrorReporting/exception_dialog.cpp
  sed -i "29i#define _Pre_null_" Sources/Sound/Win32/soundoutput_directsound.h
  sed -i "s|= min(|= std::min(|g" Sources/Sound/Win32/soundoutput_win32.cpp 
  sed -i "s|Mstcpip|mstcpip|g" Sources/Network/Socket/win32_socket.cpp
  sed -i "33i#include <in6addr.h>" Sources/Network/Socket/win32_socket.cpp 
}

build() { 
  cd ${srcdir}/ClanLib-${pkgver}
  ./autogen.sh
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    PATH=/usr/${_arch}/bin:$PATH \
    ../configure --prefix=/usr/${_arch} \
                 --host=${_arch} --disable-shared
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/ClanLib-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim: sw=2:ts=2 et:
