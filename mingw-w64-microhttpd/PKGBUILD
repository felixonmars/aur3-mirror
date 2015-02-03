# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Leo von Klenze <devel@leo.von-klenze.de>
pkgname=mingw-w64-microhttpd
pkgver=0.9.37
pkgrel=1
pkgdesc="GNU libmicrohttpd is a small C library that is supposed to make it easy to run an HTTP server as part of another application"
arch=(any)
url="http://www.gnu.org/software/libmicrohttpd/"
license=('LGPL')
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(!libtool !strip !buildflags)
source=(http://www.artfiles.org/gnu.org/libmicrohttpd/libmicrohttpd-${pkgver}.tar.gz)
md5sums=('fdf1e0534d83bbf2663f80fa7873be77')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd ${srcdir}/libmicrohttpd-${pkgver}
  
  unset LDFLAGS
  
  # we can't build the examples because iberty is missing
  sed -i 's/examples//g' src/Makefile.in
  sed -i 's/examples//g' src/Makefile.am

  for _arch in ${_architectures}; do
    mkdir build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libmicrohttpd-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install    
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g 
  done
}
