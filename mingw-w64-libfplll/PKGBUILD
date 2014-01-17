pkgname=mingw-w64-libfplll
pkgver=4.0.4
pkgrel=1

pkgdesc="Implementations of the floating-point LLL reduction algorithm for euclidean lattices"
arch=('any')
url="http://perso.ens-lyon.fr/damien.stehle/fplll/"
license=('LGPL')
makedepends=('mingw-w64-gcc')
depends=('mingw-w64-crt' 'mingw-w64-mpfr')
options=('staticlibs' '!buildflags' '!strip')
source=(http://perso.ens-lyon.fr/damien.stehle/fplll/libfplll-$pkgver.tar.gz)
md5sums=('5f418674e20908a9e105b999fa4ab3a6')
_architectures="i686-w64-mingw32" # x86_64-w64-mingw32"

prepare() {
  cd "$srcdir"/libfplll-${pkgver}
  sed -i "s|#define FPLLL_WITH_GETRUSAGE|//#define FPLLL_WITH_GETRUSAGE|g" src/defs.h
}


build() {
  cd "$srcdir"/libfplll-${pkgver}
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure --prefix=/usr/${_arch} \
                 --host=${_arch}
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libfplll-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm "$pkgdir"/usr/${_arch}/lib/*.la
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

