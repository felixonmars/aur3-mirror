pkgname=lib32-mingw-w64-ptlib
pkgver=2.10.10
pkgrel=1
pkgdesc="Portable Windows Library (mingw-w64, 32-bit)"
arch=(any)
url="http://www.opalvoip.org"
license=("GPL")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt mingw-w64-sdl mingw-w64-expat mingw-w64-openssl)
options=(!libtool !strip !buildflags)
source=("http://ftp.gnome.org/pub/GNOME/sources/ptlib/${pkgver%.*}/ptlib-$pkgver.tar.xz")
md5sums=('1fd609e25f101393bb7e42fbf874c174')

_architectures="i686-w64-mingw32" # x86_64-w64-mingw32"

_optimal_make_jobs() {
  if [ -r /proc/cpuinfo ]; then
    local core_count=$(grep -Fc processor /proc/cpuinfo)
  else
    local core_count=0
  fi
  if [ $core_count -gt 1 ]; then
    echo -n $[$core_count-1]
  else
    echo -n 1
  fi
}

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    export CPPFLAGS="$CPPFLAGS -DWINVER=0x600" # spoof at least Vista to avoid conflicts
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cp -r "${srcdir}/ptlib-${pkgver}/"* "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ./configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --disable-video
    make -j$(_optimal_make_jobs)
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
