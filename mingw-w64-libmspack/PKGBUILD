pkgname=mingw-w64-libmspack
pkgver=0.3alpha
pkgrel=1
pkgdesc="A library for Microsoft compression formats (mingw-w64)"
arch=(any)
url="http://www.cabextract.org.uk/libmspack"
license=("LGPLv2")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt)
options=(!libtool !strip !buildflags)
source=("$url/libmspack-$pkgver.tar.gz")
md5sums=('08d08455b6d58ea649b35febd23f6386')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/libmspack-$pkgver"
  sed -i "s|mkdir(path, 0777 & ~user_umask)|mkdir(path)|" "test/chmx.c"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/${pkgname#mingw-w64-}-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch}
    sed -i "s,libmspack_la_LDFLAGS = ,libmspack_la_LDFLAGS = -no-undefined ," Makefile
    sed -i "s,libmscabd_la_LDFLAGS = ,libmscabd_la_LDFLAGS = -no-undefined ," Makefile
    sed -i "s,libmschmd_la_LDFLAGS = ,libmschmd_la_LDFLAGS = -no-undefined ," Makefile
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
  done
}
