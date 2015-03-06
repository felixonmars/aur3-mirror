pkgname=mingw-w64-galib
pkgver=2.4.7
pkgrel=1
pkgdesc="A C++ Library of Genetic Algorithm Components (mingw-w64)"
arch=('any')
url="http://lancet.mit.edu/ga/"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-binutils')
options=('!buildflags' '!strip' 'staticlibs')
source=(http://lancet.mit.edu/ga/dist/galib247.tgz)
md5sums=('2b6a28fd06d4c7c4d0bb39c92b2b376c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"
  for _arch in ${_architectures}; do
    cp -r galib`echo $pkgver | tr -d .` build-${_arch} && pushd build-${_arch}
    make lib CXX=${_arch}-g++ AR="${_arch}-ar rv" RANLIB=${_arch}-ranlib CXXFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/build-${_arch}
    install -d "$pkgdir"/usr/${_arch}/lib
    make DESTDIR="$pkgdir" HDR_DEST_DIR="$pkgdir"/usr/${_arch}/include LIB_DEST_DIR="$pkgdir"/usr/${_arch}/lib install
    rm "$pkgdir"/usr/${_arch}/include/ga/{BUILD,VERSION,*.C}
    chmod a-x "$pkgdir"/usr/${_arch}/lib/*.a
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
  install -D -m644 COPYRIGHT "$pkgdir"/usr/share/licenses/${pkgname}/COPYRIGHT
}
