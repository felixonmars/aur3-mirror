pkgname=lib32-mingw-w64-libunicows
pkgver=1.1.2
pkgrel=2
pkgdesc="Microsoft Layer for Unicode (mingw-w64, 32-bit)"
arch=(any)
url="http://libunicows.sourceforge.net/"
license=("MIT")
makedepends=(mingw-w64-gcc nasm)
depends=(mingw-w64-crt)
options=(!libtool !strip !buildflags)
source=("http://downloads.sourceforge.net/libunicows/libunicows-${pkgver}-src.tar.gz")
md5sums=('8f12d5b507cd350fd835b492da30c8f5')

_architectures="i686-w64-mingw32"

build() {
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cp -r "${srcdir}/libunicows-${pkgver}/"* "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}/src"
    sed -i "s|i586-mingw32|${_arch}|g" makefile.crossmingw32
    make -f makefile.crossmingw32
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    install -Dm644 "lib/mingw32/liblibunicows.a" "$pkgdir/usr/${_arch}/lib/liblibunicows.a"
    install -Dm644 "lib/mingw32/libunicows.a" "$pkgdir/usr/${_arch}/lib/libunicows.a"
    find "$pkgdir/usr/${_arch}" -name '*.a' | xargs -rtl1 ${_arch}-strip -g
  done
}