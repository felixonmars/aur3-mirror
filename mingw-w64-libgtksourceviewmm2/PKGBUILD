pkgname=mingw-w64-libgtksourceviewmm2
pkgver=2.10.1
pkgrel=1
pkgdesc="A C++ API for gtksourceview2 (mingw-w64)"
arch=(any)
url="http://projects.gnome.org/gtksourceviewmm"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt mingw-w64-gtkmm mingw-w64-gtksourceview2)
options=(!libtool !strip !buildflags)
source=("http://ftp.gnome.org/pub/GNOME/sources/gtksourceviewmm/${pkgver%.*}/gtksourceviewmm-$pkgver.tar.bz2")
md5sums=('83d1b3dc061f02f4ff1766b37302058e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/gtksourceviewmm-$pkgver"
  sed -i "s,#include <glib/gmessages.h>,#include <glib.h>," "gtksourceview/gtksourceviewmm/sourceiter.cc"
  sed -i -e "s,AC_DISABLE_STATIC,AC_DISABLE_STATIC\nlt_cv_deplibs_check_method='pass_all'," configure.ac
  autoconf --force
  for _arch in ${_architectures}; do
    export CFLAGS="-O2 -pipe"
    export CXXFLAGS="$CFLAGS"
    export CPPFLAGS="$CPPFLAGS -D_REENTRANT"
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/gtksourceviewmm-${pkgver}/configure \
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
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}