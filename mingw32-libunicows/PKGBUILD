pkgname=mingw32-libunicows
pkgver=1.1.2
pkgrel=2
pkgdesc="Microsoft Layer for Unicode (mingw32)"
arch=(any)
url="http://libunicows.sourceforge.net/"
license=('MIT')
depends=(mingw32-runtime)
makedepends=('mingw32-gcc' 'nasm')
options=(!strip !buildflags)
source=("http://downloads.sourceforge.net/libunicows/libunicows-${pkgver}-src.tar.gz")
md5sums=('8f12d5b507cd350fd835b492da30c8f5')

build() {
  cd "$srcdir/libunicows-$pkgver/src"
  unset LDFLAGS
  sed -i 's|i586|i486|g' makefile.crossmingw32
  make -f makefile.crossmingw32
}

package() {
  cd "$srcdir/libunicows-$pkgver"
  mkdir -p "${pkgdir}/usr/i486-mingw32/lib"
  install -m644 -t "${pkgdir}/usr/i486-mingw32/lib" lib/mingw32/{liblibunicows.a,libunicows.a}
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
