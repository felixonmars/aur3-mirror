pkgname=mingw-w64-cppunit
pkgver=1.13.1
pkgrel=4
pkgdesc="A C++ unit testing framework (mingw-w64)"
arch=(any)
url="http://www.freedesktop.org/wiki/Software/cppunit"
license=("LGPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
_hash=fa9aa839145cdf860bf596532bb8af97
source=("http://dev-www.libreoffice.org/src/${_hash}-cppunit-${pkgver}.tar.gz")
md5sums=($_hash)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/cppunit-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure \
      --prefix=/usr/${_arch} \
      --host=${_arch}
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/cppunit-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
