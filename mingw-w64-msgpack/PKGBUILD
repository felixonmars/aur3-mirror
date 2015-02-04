pkgname=mingw-w64-msgpack
pkgver=0.5.9
pkgrel=3
pkgdesc="An efficient object serialization library (mingw-w64)"
arch=(any)
url="http://msgpack.org/"
license=("Apache")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
source=("https://github.com/msgpack/msgpack-c/releases/download/cpp-$pkgver/msgpack-$pkgver.tar.gz")
md5sums=('7645691e6966421c817a0b6f6f306112')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS
  cd "${srcdir}/msgpack-${pkgver}/"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/msgpack-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    #rm -r "$pkgdir/usr/${_arch}/share"
  done
}
