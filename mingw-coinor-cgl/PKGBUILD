
pkgname=mingw-coinor-cgl
pkgver=0.58.10
pkgrel=1
pkgdesc="COIN-OR Cut Generation Library (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/Cgl"
license=('EPL')
groups=('coinor')
depends=('mingw-w64-coinor-clp')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/source/Cgl/Cgl-${pkgver}.tgz")
sha1sums=('65856a2c9b000bb35103bdada3dba73b1cbd0b0f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd Cgl-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    COIN_SKIP_PROJECTS="Sample" \
    ./configure --prefix=/usr \
                --with-osi-lib="$(${_arch}-pkg-config --libs osi)" \
                --with-osi-incdir="/usr/${_arch}/include/coin/" \
                --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
                --with-coinutils-incdir="/usr/${_arch}/include/coin/" \
                --with-clp-lib="$(${_arch}-pkg-config --libs clp)" \
                --with-clp-incdir="/usr/${_arch}/include/coin/" \
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Cgl-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
