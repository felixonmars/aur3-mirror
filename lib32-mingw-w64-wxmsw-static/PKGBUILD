pkgname=lib32-mingw-w64-wxmsw-static
pkgver=2.8.12
pkgrel=3
pkgdesc="wxWidgets API for GUI (mingw-w64, 32-bit, static)"
arch=(any)
url="http://wxwidgets.org"
license=("custom:wxWindows")
makedepends=(mingw-w64-gcc)
depends=(mingw-w64-crt)
conflicts=(lib32-mingw-w64-wxmsw)
provides=(lib32-mingw-w64-wxmsw)
options=(!libtool !strip !buildflags)
source=("http://downloads.sourceforge.net/wxwindows/wxMSW-$pkgver.tar.bz2")
md5sums=('4bda849b9f7c66b58c4bc92e505ea714')

_architectures="i686-w64-mingw32"

build() {
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/wxMSW-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --with-msw \
      --enable-unicode \
      --disable-mslu \
      --enable-static \
      --disable-shared
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.a' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
