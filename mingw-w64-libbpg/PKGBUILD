
pkgname=mingw-w64-libbpg
pkgver=0.9.4
pkgrel=1
pkgdesc='BPG Image Encoder and Decoder (mingw-w64)'
arch=('any')
url='http://bellard.org/bpg/'
license=('BSD' 'LGPL')
depends=('mingw-w64-libpng' 'mingw-w64-libjpeg-turbo' 'mingw-w64-x265')
source=("${url}libbpg-$pkgver.tar.gz")
options=('!buildflags' '!strip' 'staticlibs')
md5sums=('4d7ed917ce57001d5481b465fe9a1735')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"
  for _arch in ${_architectures}; do
    cp -r libbpg-$pkgver build-${_arch} && pushd build-${_arch}
    make USE_X265=Y CONFIG_WIN32=y CROSS_PREFIX=${_arch}- libbpg.a
    ${_arch}-gcc -shared -o libbpg.dll libavcodec/*.o libavutil/*.o *.o -Wl,--out-implib,libbpg.dll.a 
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/build-${_arch}"
    install -d "$pkgdir"/usr/${_arch}/{include,lib,bin}
    install -m644 libbpg*.a "$pkgdir"/usr/${_arch}/lib
    install -m755 libbpg.dll "$pkgdir"/usr/${_arch}/bin
    install -m644 libbpg.h bpgenc.h "$pkgdir"/usr/${_arch}/include
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

