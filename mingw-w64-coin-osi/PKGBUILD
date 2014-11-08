pkgname=mingw-w64-coin-osi
pkgver=0.106.6
pkgrel=1
pkgdesc="Osi (Open Solver Interface) provides an abstract base class to a generic linear programming (LP) solver, along with derived classes for specific solvers. (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/Osi"
license=('EPL')
groups=('coin-or')
depends=('mingw-w64-coin-utils')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=(http://www.coin-or.org/download/source/Osi/Osi-$pkgver.tgz)
sha512sums=('25d2dd1791b73329fa9bc32f7b4a4f3d0600ce600868bd14d902dd0ea1c6f5a2eca4bff01ac65ea2843e725fd5c218fca6def9d6974e6af9692c47973b6202ef')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd Osi-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    COIN_SKIP_PROJECTS="Sample" \
    ${_arch}-configure \
                 --with-coinutils-lib="$(${_arch}-pkg-config --libs coinutils)" \
                 --with-coinutils-incdir="/usr/${_arch}/include/coin/" \
                 -C
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Osi-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
