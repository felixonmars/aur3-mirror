pkgname=mingw-w64-gtkmm3
pkgver=3.10.0
pkgrel=1
pkgdesc="C++ bindings for gtk3 (mingw-w64)"
arch=(any)
url="http://gtkmm.org"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt mingw-w64-atkmm mingw-w64-pangomm mingw-w64-gtk3)
options=(staticlibs !strip !buildflags)
source=("http://ftp.gnome.org/pub/GNOME/sources/gtkmm/${pkgver%.*}/gtkmm-$pkgver.tar.xz")
sha256sums=('5e45fed4a7cff1baa72d1ef67e0d9883063d3a575cb53190e7ecf27047d241f8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    export CFLAGS="-O2 -pipe"
    export CXXFLAGS="$CFLAGS"
    export CPPFLAGS="$CPPFLAGS -D_REENTRANT"
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    "${srcdir}"/gtkmm-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --enable-shared \
      --enable-static \
      --disable-documentation
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