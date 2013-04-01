pkgname=mingw-w64-libassuan
pkgver=2.1.0
pkgrel=1
pkgdesc="A IPC library used by some GnuPG related software (mingw-w64)"
arch=(any)
url="http://www.gnupg.org/related_software/libassuan"
license=("GPL")
makedepends=(mingw-w64-gcc)
depends=(mingw-w64-crt mingw-w64-libgpg-error)
options=(!libtool !strip !buildflags)
source=("ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-$pkgver.tar.bz2")
md5sums=('b3231eec8e567f4f9294474a387378f5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/libassuan-$pkgver"
  sed -i "s,EXPORTS,," "src/libassuan.def"
  for _arch in ${_architectures}; do
    if [ $_arch = "x86_64-w64-mingw32" ]; then
      export CFLAGS="-DHAVE_DOSISH_SYSTEM=1"
    fi
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/${pkgname#mingw-w64-}-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --enable-static \
      --enable-shared \
      --with-libgpg-error-prefix=/usr/${_arch}
    make
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