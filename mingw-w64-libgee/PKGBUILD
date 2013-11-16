pkgname=mingw-w64-libgee
pkgver=0.12.0
pkgrel=1
pkgdesc="GObject collection library (mingw-w64)"
arch=(any)
url="http://live.gnome.org/Libgee"
license=("LGPL2.1")
depends=(mingw-w64-crt mingw-w64-glib2)
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
options=(staticlibs !strip !buildflags)
source=("http://ftp.gnome.org/pub/GNOME/sources/libgee/${pkgver%.*}/libgee-$pkgver.tar.xz")
md5sums=('d9965e1797d76775ae440230f30585f8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libgee-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure \
      --prefix=/usr/${_arch} \
      --host=${_arch} \
      --enable-static \
      --enable-shared
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libgee-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll 
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
