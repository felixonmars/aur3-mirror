pkgname=lib32-mingw-w64-apr-util
pkgver=1.4.1
pkgrel=2
pkgdesc="The Apache Portable Runtime (mingw-w64, 32-bit)"
arch=(any)
url="http://apr.apache.org"
license=("Apache")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt lib32-mingw-w64-apr)
options=(!libtool !strip !buildflags)
source=("http://ftp.wayne.edu/apache//apr/apr-util-$pkgver.tar.bz2")
md5sums=('52b31b33fb1aa16e65ddaefc76e41151')

_architectures="i686-w64-mingw32"

build() {
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/${pkgname#lib32-mingw-w64-}-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --with-apr=/usr/${_arch} \
      --with-crypto
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