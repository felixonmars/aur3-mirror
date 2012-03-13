pkgname=mingw32-speex
pkgver=1.2rc1
pkgrel=3
pkgdesc="A free codec for free speech (mingw32)"
arch=('any')
license=('BSD')
depends=('mingw32-runtime' 'mingw32-libogg')
makedepends=(mingw32-gcc)
options=('!strip' '!buildflags' '!libtool')
source=("http://downloads.us.xiph.org/releases/speex/speex-$pkgver.tar.gz")
md5sums=('c4438b22c08e5811ff10e2b06ee9b9ae')
url="http://www.speex.org/"

build() {
   cd "$srcdir/speex-$pkgver"
   unset LDFLAGS
   mkdir -p build && cd build
   ../configure \
    --host=i486-mingw32 \
    --prefix=/usr/i486-mingw32
   make
}

package() {
  cd "$srcdir/speex-$pkgver/build"
   make DESTDIR=$pkgdir install
   i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
   i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
   i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
   rm -rf $pkgdir/usr/i486-mingw32/share/{doc,man}
}
