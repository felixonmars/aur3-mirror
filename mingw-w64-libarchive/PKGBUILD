pkgname=mingw-w64-libarchive
pkgver=3.1.2
pkgrel=2
pkgdesc="library that can create and read several streaming archive formats (mingw-w64)"
arch=(any)
url="http://libarchive.googlecode.com"
license=("BSD")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt
mingw-w64-bzip2
mingw-w64-expat
mingw-w64-lzo2
mingw-w64-nettle
mingw-w64-openssl
mingw-w64-xz
mingw-w64-zlib)
options=(!libtool !strip !buildflags)
source=("http://libarchive.org/downloads/libarchive-$pkgver.tar.gz"
"0001-mtree-fix-line-filename-length-calculation.patch")
md5sums=('efad5a503f66329bb9d2f4308b5de98a'
         '9727baf88b928417d5d1269891b1209a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/libarchive-$pkgver"
  patch -Np1 -i "$srcdir/0001-mtree-fix-line-filename-length-calculation.patch"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/${pkgname#mingw-w64-}-${pkgver}/configure \
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
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
