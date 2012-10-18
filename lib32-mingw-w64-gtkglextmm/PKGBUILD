pkgname=lib32-mingw-w64-gtkglextmm
pkgver=1.2.0
pkgrel=2
pkgdesc="Cpp C++ bindings for gtkglext (mingw-w64, 32-bit)"
arch=(any)
url="http://gtkglext.sourceforge.net"
license=("GPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt
lib32-mingw-w64-gtkmm
lib32-mingw-w64-gtkglext)
options=(!libtool !strip !buildflags)
source=("http://downloads.sourceforge.net/sourceforge/gtkglext/gtkglextmm-${pkgver}.tar.bz2"
"gdkspanfunc.patch")
md5sums=('27c05f4d45c5fd07b6fb0f044add3056'
         'd7c8ea33c748a6857ee629c16b2d9bff')

_architectures="i686-w64-mingw32"

build() {
  cd "$srcdir/gtkglextmm-$pkgver"
  patch -Np1 -i "${srcdir}/gdkspanfunc.patch"
  for _arch in ${_architectures}; do
    export CFLAGS="-O2 -pipe"
    export CXXFLAGS="$CFLAGS"
    export CPPFLAGS="$CPPFLAGS -D_REENTRANT"
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/gtkglextmm-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --with-gdktarget=win32 \
      --disable-gtkglext-test
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/$_arch/share"
  done
}