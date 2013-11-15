pkgname=mingw-w64-cairomm
pkgver=1.10.0
pkgrel=5
pkgdesc="C++ bindings to Cairo vector graphics library (mingw-w64)"
arch=(any)
url="http://www.cairographics.org"
license=("LGPL, MPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config mingw-w64-glib2)
depends=(mingw-w64-crt mingw-w64-libsigc++ mingw-w64-cairo)
options=(!strip !buildflags staticlibs)
source=("http://www.cairographics.org/releases/cairomm-${pkgver}.tar.gz")
sha1sums=('f08bf8a331067f0d1e876523f07238fba6b26b99')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    export CFLAGS="-O2 -pipe"
    export CXXFLAGS="$CFLAGS"
    export CPPFLAGS="$CPPFLAGS -D_REENTRANT"
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --enable-static \
      --enable-shared \
      --disable-documentation
    sed -i "s/deplibs_check_method=.*/deplibs_check_method=pass_all/g" libtool
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