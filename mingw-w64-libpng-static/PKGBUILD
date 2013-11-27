# Maintainer: Никола Вукосављевић <hauzer@gmx.com>
# Contributor: Daniel Kirchner <daniel AT ekpyron DOT org>

pkgname=mingw-w64-libpng-static
pkgver=1.6.7
pkgrel=1
arch=('any')
pkgdesc="A collection of routines used to create PNG format graphics (mingw-w64, static)"
depends=('mingw-w64-zlib' 'mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'xz')
provides=('mingw-w64-libpng')
conflicts=('mingw-w64-libpng')
license=('custom')
url="http://www.libpng.org/pub/png/libpng.html"
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/sourceforge/libpng/libpng-$pkgver.tar.xz"
        "http://downloads.sourceforge.net/project/libpng-apng/libpng16/$pkgver/libpng-$pkgver-apng.patch.gz")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_targetarch32=i686-w64-mingw32
_targetarch64=x86_64-w64-mingw32
md5sums=('7023a9eacd7b6a3eb95761a2f574d456'
         'aad92ea0cc3e29415b90c78f1d267799')

build() {
  cd "$srcdir/libpng-$pkgver"

  # Add animated PNG (apng) support
  # see http://sourceforge.net/projects/libpng-apng/
  patch -p1 -i "${srcdir}/libpng-$pkgver-apng.patch"

  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/build-${_arch}"
    cd "${srcdir}/build-${_arch}"
    ../libpng-${pkgver}/configure --host=${_arch} --prefix=/usr/${_arch} \
        --disable-shared \
        --enable-static
    make
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    rm -rf "${pkgdir}/usr/${_arch}/share/man"
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done

  install -D -m644 "${srcdir}/libpng-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

