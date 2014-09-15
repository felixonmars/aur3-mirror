
pkgname=mingw-w64-id3lib
pkgver=3.8.3
pkgrel=1
pkgdesc='Library for reading, writing, and manipulating ID3v1 and ID3v2 tags (mingw-w64)'
arch=('any')
license=('LGPL')
url="http://id3lib.sourceforge.net/"
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-crt' 'mingw-w64-zlib')
makedepends=('mingw-w64-gcc')
source=("http://downloads.sourceforge.net/sourceforge/id3lib/id3lib-${pkgver}.tar.gz"
        id3lib-3.8.3-io_helpers-163101.patch
        id3lib-3.8.3-mkstemp.patch
        id3lib-3.8.3-includes.patch
        http://launchpadlibrarian.net/33114077/id3lib-vbr_buffer_overflow.diff
        id3lib-3.8.3-autoreconf.patch
        id3lib-3.8.3-mingw.patch)
md5sums=('19f27ddd2dda4b2d26a559a4f0f402a7'
         'dd35e79167c3da432590d239d2665b02'
         'aec824499b0118493b96ed3f188640f2'
         '1ff46b5fa2cdb12cb85f1a1cb689dbca'
         '180f1007ad63fece0ee2ce4bbd3798f8'
         '440960cdb85b78cd718b6275336eba96'
         '5751591c71cfeb7d434666761840b2e7')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/id3lib-${pkgver}"
  patch -p1 -i ../id3lib-3.8.3-io_helpers-163101.patch
  patch -p1 -i ../id3lib-3.8.3-mkstemp.patch
  patch -p1 -i ../id3lib-3.8.3-includes.patch
  patch -p1 -i ../id3lib-vbr_buffer_overflow.diff
  patch -p1 -i ../id3lib-3.8.3-autoreconf.patch
  patch -p1 -i ../id3lib-3.8.3-mingw.patch
}

build() {
  cd "${srcdir}/id3lib-${pkgver}"
  autoreconf --force --install
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure --prefix=/usr/${_arch} \
                 --host=${_arch}
    make libid3_la_LIBADD=-lz
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/id3lib-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
