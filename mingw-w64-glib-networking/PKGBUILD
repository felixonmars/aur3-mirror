pkgname=mingw-w64-glib-networking
pkgver=2.40.1
pkgrel=1
pkgdesc="Network-related giomodules for glib (mingw-w64)"
arch=(any)
url="http://www.gtk.org"
license=("GPL2")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config intltool)
depends=(mingw-w64-crt "mingw-w64-glib2>=2.40.0" mingw-w64-gnutls)
options=(!strip !buildflags staticlibs)
source=("http://download.gnome.org/sources/glib-networking/${pkgver%.*}/glib-networking-$pkgver.tar.xz")
sha256sums=('9fb3e54d049a480afdb814ff7452e7ab67e5d5f607ade230d7713f19922b5a28')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --disable-glibtest \
      --disable-installed-tests \
      --disable-always-build-tests
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir/usr/${_arch}/bin"
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
