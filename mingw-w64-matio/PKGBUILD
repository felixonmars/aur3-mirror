
pkgname=mingw-w64-matio
pkgver=1.5.2
pkgrel=1
pkgdesc='C library with a fortran 90/95 module interface for reading/writing MATLAB MAT-files (mingw-w64)'
arch=('any')
license=('BSD')
url='http://sourceforge.net/projects/matio'
depends=('mingw-w64-zlib' 'mingw-w64-hdf5')
makedepends=('mingw-w64-gcc')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://downloads.sourceforge.net/matio/matio-$pkgver.tar.gz")
sha1sums=('d5a83a51eb2550d75811d2dde967ef3e167d4f52')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd matio-$pkgver
  sed -i "48ilibmatio_la_LDFLAGS = -no-undefined" src/Makefile.am
  sed -i "50ilibmatio_la_LIBADD += \$(HDF5_LIBS)" src/Makefile.am 
}

build() {
  cd matio-$pkgver
  ./autogen.sh
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure --prefix=/usr/${_arch} \
                 --host=${_arch}
    make
    popd
  done
}
 
package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/matio-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
