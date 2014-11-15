
pkgname=mingw-w64-confuse
pkgver=2.7
pkgrel=7
pkgdesc="C-library for parsing configuration files (mingw-w64)"
arch=('any')
url="http://www.nongnu.org/confuse"
license=('LGPL')
depends=('mingw-w64-gettext')
makedepends=('mingw-w64-configure')
source=("http://savannah.nongnu.org/download/confuse/confuse-${pkgver}.tar.gz"
        'confuse-mingw.patch')
options=('staticlibs' '!buildflags' '!strip')
md5sums=('45932fdeeccbb9ef4228f1c1a25e9c8f'
         '192a32be6bf6481d5cc173664204ea98')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/confuse-${pkgver}"
  patch -p1 -i "${srcdir}"/confuse-mingw.patch
  autoreconf -vfi
}

build() {
  cd "${srcdir}/confuse-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-examples
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/confuse-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
