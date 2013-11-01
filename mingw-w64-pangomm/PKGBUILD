pkgname=mingw-w64-pangomm
pkgver=2.34.0
pkgrel=2
pkgdesc="C++ bindings for pango (mingw-w64)"
arch=(any)
url="http://gtkmm.sourceforge.net"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt mingw-w64-cairomm mingw-w64-glibmm mingw-w64-pango)
options=(staticlibs !strip !buildflags)
source=("http://ftp.gnome.org/pub/GNOME/sources/pangomm/${pkgver%.*}/pangomm-$pkgver.tar.xz")
sha256sums=('0e82bbff62f626692a00f3772d8b17169a1842b8cc54d5f2ddb1fec2cede9e41')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "$srcdir/pangomm-$pkgver"
  sed -i -e "s,AC_DISABLE_STATIC,AC_DISABLE_STATIC\nlt_cv_deplibs_check_method='pass_all'," configure.ac
  autoconf --force
}

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