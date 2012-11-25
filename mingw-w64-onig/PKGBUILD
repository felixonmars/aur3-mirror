pkgname=mingw-w64-onig
pkgver=5.9.3
pkgrel=1
pkgdesc="a regular expressions library (mingw-w64)"
arch=(any)
url="http://www.geocities.jp/kosako3/oniguruma"
license=("BSD")
makedepends=(mingw-w64-gcc)
depends=(mingw-w64-crt)
options=(!libtool !strip !buildflags)
source=("http://www.geocities.jp/kosako3/oniguruma/archive/onig-$pkgver.tar.gz")
md5sums=('0d4eda2066d3c92970842a6790ce897a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/onig-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch}
    make
    ${_arch}-gcc -shared .libs/*.o -o libonig.dll -Xlinker --out-implib -Xlinker libonig.dll.a
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    install -m644 "libonig.dll" "$pkgdir/usr/${_arch}/bin/"
    install -m644 "libonig.dll.a" "$pkgdir/usr/${_arch}/lib/"
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}
