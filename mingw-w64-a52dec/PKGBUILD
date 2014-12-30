
pkgname=mingw-w64-a52dec
pkgver=0.7.4
pkgrel=1
pkgdesc="A free library for decoding ATSC A/52 streams (mingw-w64)"
url="http://liba52.sourceforge.net/"
arch=('any')
license=('GPL2')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=(!strip !buildflags staticlibs)
source=("http://liba52.sourceforge.net/files/a52dec-${pkgver}.tar.gz"
        'a52dec-0.7.4-build.patch')
md5sums=('caa9f5bc44232dc8aeea773fea56be80'
         'fa16f224a7dceb7613824380abef0052')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/a52dec-${pkgver}"
  patch -Np1 -i ../a52dec-0.7.4-build.patch
  autoreconf -vfi
}

build() {
  cd "${srcdir}/a52dec-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/a52dec-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
