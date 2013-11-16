pkgname=mingw-w64-lzo2
pkgver=2.06
pkgrel=2
pkgdesc="Portable lossless data compression library (mingw-w64)"
arch=(any)
url="http://www.oberhumer.com/opensource/lzo"
license=("GPL")
makedepends=(mingw-w64-gcc)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
source=("$url/download/lzo-${pkgver}.tar.gz")
md5sums=('95380bd4081f85ef08c5209f4107e9f8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/lzo-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure \
      --prefix=/usr/${_arch} \
      --host=${_arch} \
      --build=$CHOST \
      --enable-static \
      --enable-shared
    make
    ${_arch}-gcc -shared src/*.o -o src/liblzo2-0.dll -Xlinker --out-implib -Xlinker src/liblzo2.dll.a
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/lzo-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    install -Dm644 src/liblzo2-0.dll "${pkgdir}"/usr/${_arch}/bin/liblzo2-0.dll
    install -m644 src/liblzo2.dll.a "${pkgdir}"/usr/${_arch}/lib/liblzo2.dll.a
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-debug "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
