# Contributor: Alexander Jakopin <setrodox@users.sourceforge.net>
pkgname=mingw32-allegro
pkgver=5.0.7
pkgrel=1
license=(custom)
arch=(any)
options=(!strip !buildflags)
depends=(mingw32-runtime mingw32-dx7-headers)
makedepends=(mingw32-gcc cmake)
optdepends=("mingw32-freetype: TrueType font support"
"mingw32-flac: FLAC audio file support"
"mingw32-physfs: HOG/Zip/7Zip/MVL/GRP/WAD/PAK archive support"
"mingw32-libogg"
"mingw32-libvorbis: Ogg-Vorbis audio file support"
"mingw32-zlib"
"mingw32-libpng: PNG image file support"
"mingw32-libjpeg-turbo: JPEG image file support"
"mingw32-openal: OpenAL support")
pkgdesc="Portable library mainly aimed at video game and multimedia programming (mingw32)"
source=("http://downloads.sourceforge.net/project/alleg/allegro/$pkgver/allegro-$pkgver.tar.gz"
"cmake-toolchain.cmake")
url=("http://alleg.sourceforge.net/")
md5sums=('e4ed66093edf45497f45411488dd82e6'
         'dd2b2db48187dff84050fe191d309d81')
build() {
  cd "$srcdir/allegro-$pkgver"
  unset LDFLAGS
  cmake \
    -DCMAKE_INSTALL_PREFIX="/usr/i486-mingw32/" \
    -DCMAKE_TOOLCHAIN_FILE="$srcdir/cmake-toolchain.cmake" \
    -DWANT_EXAMPLES=OFF
  make
}
package() {
  cd "$srcdir/allegro-$pkgver"
  make install DESTDIR=$pkgdir
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
