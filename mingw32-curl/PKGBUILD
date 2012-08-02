pkgname=mingw32-curl
pkgver=7.27.0
pkgrel=1
pkgdesc="An URL retrival utility and library. (mingw32)"
arch=(any)
url="http://curl.haxx.se"
license=("MIT")
depends=(mingw32-runtime mingw32-openssl mingw32-zlib mingw32-libidn)
makedepends=(mingw32-gcc)
source=("http://curl.haxx.se/download/curl-$pkgver.tar.bz2")
md5sums=('11fcbfc0de9c12512e607e7d72d500a0')
options=(!strip !buildflags !libtool)

build() {
  cd "$srcdir/curl-$pkgver"
  unset LDFLAGS
  ./configure \
    --without-ca-bundle \
    --without-gnutls \
    --without-random \
    --with-zlib=/usr/i486-mingw32 \
    --with-ssl=/usr/i486-mingw32 \
    --with-libidn=/usr/i486-mingw32 \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --disable-ldap
  make
}

package() {
  cd "$srcdir/curl-$pkgver"
  make DESTDIR=${pkgdir} install
  i486-mingw32-strip "$pkgdir/usr/i486-mingw32/bin/"*.exe
  i486-mingw32-strip -x -g "$pkgdir/usr/i486-mingw32/bin/"*.dll
  i486-mingw32-strip -g "$pkgdir/usr/i486-mingw32/lib/"*.a
  rm -rf "$pkgdir/usr/i486-mingw32/share"
}
