pkgname=mingw-w64-gtksourceview2
pkgver=2.10.5
pkgrel=3
pkgdesc="A text widget adding syntax highlighting and more to GNOME (mingw-w64)"
arch=(any)
url="http://www.gnome.org"
license=("GPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config intltool)
depends=(mingw-w64-crt mingw-w64-gtk2 mingw-w64-libxml2)
options=(staticlibs !strip !buildflags)
source=("http://ftp.gnome.org/pub/gnome/sources/gtksourceview/${pkgver%.*}/gtksourceview-${pkgver}.tar.bz2")
md5sums=('1219ad1694df136f126507466aeb41aa')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    "${srcdir}"/gtksourceview-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --enable-static \
      --enable-shared
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
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}