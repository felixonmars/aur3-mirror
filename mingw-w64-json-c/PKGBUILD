pkgname=mingw-w64-json-c
pkgver=0.12
pkgrel=1
pkgdesc="A JSON implementation in C (mingw-w64)"
arch=(any)
url="https://github.com/json-c/json-c/wiki"
license=("MIT")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt)
options=(!libtool !strip !buildflags)
source=("https://s3.amazonaws.com/json-c_releases/releases/json-c-$pkgver.tar.gz")
sha256sums=('000c01b2b3f82dcb4261751eb71f1b084404fb7d6a282f06074d3c17078b9f3f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    export CFLAGS="$CFLAGS -Wno-error"
    export CPPFLAGS="$CPPFLAGS -Wno-error"
    export ac_cv_func_malloc_0_nonnull=yes
    export ac_cv_func_realloc_0_nonnull=yes
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/${pkgname#mingw-w64-}-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch}
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}
