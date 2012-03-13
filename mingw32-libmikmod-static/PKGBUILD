pkgname=mingw32-libmikmod-static
pkgver=3.1.12
pkgrel=3
pkgdesc="A portable sound library (mingw32, static)"
arch=(any)
url="http://sourceforge.net/projects/mikmod/"
license=('LGPL')
depends=('mingw32-runtime' 'mingw32-zlib-static')
provides=('mingw32-libmikmod')
conflicts=('mingw32-libmikmod')
source=("http://downloads.sourceforge.net/sourceforge/mikmod/libmikmod%20%28source%29/$pkgver/libmikmod-$pkgver.tar.gz")
md5sums=('9f3c740298260d5f88981fc0d51f6f16')
options=('!strip' '!buildflags' '!libtool')

build() {
  cd "$srcdir/libmikmod-$pkgver"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --disable-shared # compile error
  make
}

package() {
  cd "$srcdir/libmikmod-$pkgver/build"
  make DESTDIR=${pkgdir} install
  rm -rf $pkgdir/usr/i486-mingw32/{info,man}
}
