
pkgname=mingw-w64-coin-utils
pkgver=2.9.9
pkgrel=1
pkgdesc="CoinUtils (Coin-or Utilities) is an open-source collection of classes and functions that are generally useful to more than one COIN-OR project. (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/CoinUtils"
license=('EPL')
groups=('coin-or')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/source/CoinUtils/CoinUtils-${pkgver}.tgz")
sha512sums=('3d26fc9910c167afe30a4101bdd63ebbb90b1d7f7411f6a59358f61218a56f25f999498e4f50d9654b5bcd2b011c09b4c81ed66145565eac1f48b957dd40a2b3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"/CoinUtils-$pkgver
  #sed -i "98ilibCoinUtils_la_LDFLAGS += -no-undefined" CoinUtils/src/Makefile.am
  # FIXME: cannot boostrap
  # autoreconf -vi 
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch} -configure -C
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
