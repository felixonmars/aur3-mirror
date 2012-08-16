pkgname=mingw-w64-ppl
pkgver=1.0
pkgrel=1
pkgdesc="A modern library for convex polyhedra and other numerical abstractions. (mingw-w64)"
arch=(any)
url="http://bugseng.com/products/ppl"
license=("GPL3")
makedepends=(mingw-w64-gcc)
depends=(mingw-w64-crt "mingw-w64-gmp>=5.0")
options=(!libtool !strip !buildflags)
source=("http://bugseng.com/products/ppl/download/ftp/releases/$pkgver/ppl-$pkgver.tar.gz")
md5sums=('c4566928c6b7bb63e95f96d1a7b5cb4c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/${pkgname#mingw-w64-}-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --enable-interfaces="c,cxx" \
      --disable-documentation
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}