pkgname=lib32-mingw-w64-apr
pkgver=1.4.6
pkgrel=5
pkgdesc="The Apache Portable Runtime (mingw-w64, 32-bit)"
arch=(any)
url="http://apr.apache.org"
license=("Apache")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt)
options=(!libtool !strip !buildflags)
source=("http://mirror.atlanticmetro.net/apache//apr/apr-$pkgver.tar.bz2")
md5sums=('ffee70a111fd07372982b0550bbb14b7')

_architectures="i686-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/${pkgname#lib32-mingw-w64-}-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch}
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.a' | xargs -rtl1 ${_arch}-strip -g
  done
}