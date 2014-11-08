
pkgname=mingw-w64-tre
pkgver=0.8.0
pkgrel=1
arch=('any')
pkgdesc="POSIX compliant regexp matching library. Includes agrep for aproximate grepping. (mingw-w64)"
url="http://laurikari.net/tre"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
license=('custom:BSD')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://laurikari.net/tre/tre-$pkgver.tar.bz2")
md5sums=('b4d3232593dadf6746f4727bdda20b41')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/tre-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-nls 
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do  
    cd "$srcdir/tre-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


