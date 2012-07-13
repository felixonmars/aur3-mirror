pkgname=mingw32-nettle
pkgver=2.5
pkgrel=1
pkgdesc="A low-level cryptographic library (mingw32)"
arch=('any')
license=('LGPL')
depends=(mingw32-runtime)
makedepends=(mingw32-gcc)
url="http://www.lysator.liu.se/~nisse/nettle/"
options=(!strip !buildflags)
optdepends=('mingw32-gmp: GNU MP algorithm support')
source=("ftp://ftp.lysator.liu.se/pub/security/lsh/nettle-$pkgver.tar.gz")
md5sums=('d66882e6ad31a9f651b73d7a1a93bd4c')

build() {
  cd "$srcdir/nettle-$pkgver"
  unset LDFLAGS
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --enable-shared
  make
}

package() {
  cd "$srcdir/nettle-$pkgver"
  make install DESTDIR=$pkgdir
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -x -g $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm -rf "$pkgdir/usr/i486-mingw32/share"
}

# vim:set ts=2 sw=2 et:
