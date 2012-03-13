pkgname=mingw32-libtheora
pkgver=1.1.1
pkgrel=2
pkgdesc="An open video codec developed by the Xiph.org (mingw32)"
arch=(any)
url="http://xiph.org"
license=('BSD custom')
depends=('mingw32-runtime' 'mingw32-libogg' 'mingw32-libvorbis')
makedepends=('mingw32-gcc' 'mingw32-binutils' 'mingw32-w32api')
options=(!libtool !strip !buildflags)
source=("http://downloads.xiph.org/releases/theora/libtheora-$pkgver.tar.bz2")
md5sums=('292ab65cedd5021d6b7ddd117e07cd8e')

build() {
  cd "$srcdir/libtheora-$pkgver"
  unset LDFLAGS
  CFLAGS=${CFLAGS/-march=$CARCH}
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32\
    --enable-static \
    --enable-shared
  make
}

package() {
  cd "$srcdir/libtheora-$pkgver/build"
  make DESTDIR="$pkgdir" install
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm -rf "$pkgdir/usr/i486-mingw32/share"
}
