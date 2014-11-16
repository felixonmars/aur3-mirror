pkgname=mingw-w64-nspr
pkgver=4.10.6
pkgrel=2
pkgdesc="Netscape Portable Runtime (mingw-w64)"
arch=(any)
url="http://www.mozilla.org/projects/nspr/"
license=('MPL' 'GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${pkgver}/src/nspr-${pkgver}.tar.gz"
        'nspr-mingw.patch')
md5sums=('6ab81e8d508457905223eaf4ed0a973b'
        '862eae399e0eefa3eabe84412339b781')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


prepare () {
  cd "$srcdir/nspr-$pkgver/nspr"
  patch -p1 -i "$srcdir"/nspr-mingw.patch
  autoreconf -vfi
}


build() {
  cd "$srcdir/nspr-$pkgver/nspr"
  for _arch in ${_architectures}; do
    if [ "${_arch}" = "x86_64-w64-mingw32" ]; then
      _confflags="--enable-64bit"
    else
      _confflags=""
    fi
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-win32-target=WINNT \
      --enable-optimize \
      --disable-debug ${_confflags}
    make -C config export CC=gcc CFLAGS="-DXP_UNIX=1"
    make NSINSTALL=$(pwd)/config/nsinstall RC=${_arch}-windres RANLIB=${_arch}-ranlib
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/nspr-${pkgver}/nspr/build-${_arch}
    make install DESTDIR="$pkgdir" NSINSTALL=$(pwd)/config/nsinstall
    rm -r "$pkgdir"/usr/${_arch}/share
    rm -r "$pkgdir"/usr/${_arch}/bin/{compile-et.pl,prerr.properties} \
          "$pkgdir/usr/${_arch}/include/nspr/md"
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
