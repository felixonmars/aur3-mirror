
pkgname=mingw-w64-coinor-utils
pkgver=2.9.17
pkgrel=1
pkgdesc="COIN-OR collection of utility classes (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/CoinUtils"
license=('EPL')
groups=('coinor')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/source/CoinUtils/CoinUtils-${pkgver}.tgz")
sha1sums=('d06a32e6e87ea433f646ea30deef9dd1d7ee1c8e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"/CoinUtils-$pkgver
  #sed -i "98ilibCoinUtils_la_LDFLAGS += -no-undefined" CoinUtils/src/Makefile.am
  # FIXME: cannot boostrap
  # autoreconf -vi 
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure -C
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/CoinUtils-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
