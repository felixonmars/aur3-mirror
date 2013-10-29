

pkgname=mingw-w64-libltdl
pkgver=2.4.2
pkgrel=3
pkgdesc="A system independent dlopen wrapper for GNU libtool (mingw-w64)"
arch=(any)
url="http://www.gnu.org/software/libtool"
license=("GPL")
makedepends=(mingw-w64-gcc)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
source=("http://ftp.gnu.org/pub/gnu/libtool/libtool-${pkgver}.tar.xz")
md5sums=('2ec8997e0c07249eb4cbd072417d70fe')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libtool-${pkgver}"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch}
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libtool-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/usr/${_arch}/share"
    rm -r "$pkgdir/usr/${_arch}/bin/libtool"{,ize}
  done
}

