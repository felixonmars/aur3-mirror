
pkgname=mingw-w64-admesh
pkgver=0.98.0
pkgrel=1
pkgdesc="Program for processing STL triangulated solid meshes (mingw-w64)"
arch=('any')
url="http://www.varlog.com/admesh-htm"
license=('GPL2')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/admesh/admesh/releases/download/v$pkgver/admesh-$pkgver.tar.gz")
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/admesh-$pkgver"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure --prefix=/usr/${_arch} \
                 --host=${_arch} \
                 --enable-static
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/admesh-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}