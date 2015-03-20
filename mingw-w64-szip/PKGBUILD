pkgname=mingw-w64-szip
pkgver=2.1
pkgrel=1
pkgdesc="High compression library (mingw-w64)"
url="http://www.hdfgroup.org/doc_resource/SZIP"
arch=('any')
license="custom"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!buildflags' '!strip' 'staticlibs')
source=(http://www.hdfgroup.org/ftp/lib-external/szip/${pkgver}/src/szip-${pkgver}.tar.gz)
md5sums=('902f831bcefb69c6b635374424acbead')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/szip-$pkgver"
  sed -i "s|_la_LDFLAGS = -version-info|_la_LDFLAGS = -no-undefined -version-info|" src/Makefile.am
  autoreconf -vi
}

build() {
  cd "$srcdir/szip-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/szip-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    chmod a-x "$pkgdir"/usr/${_arch}/lib/*.dll.a
    rm "$pkgdir"/usr/${_arch}/lib/*.la
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
  install -D -m644 "$srcdir"/szip-${pkgver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

