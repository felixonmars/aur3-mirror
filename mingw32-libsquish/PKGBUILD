# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=mingw32-libsquish
pkgver=1.11
pkgrel=1
pkgdesc="DXT compression library"
arch=('any')
url="http://code.google.com/p/libsquish"
license=('MIT')
options=(!buildflags !strip)
source=(http://libsquish.googlecode.com/files/squish-$pkgver.zip
        gcc440.patch
        config
        LICENSE)
sha1sums=('1fdff1ba72a002900c877baebcf0aeab9af4922b'
          '51bcc11eafbf79d9cde24769397c7a42f886154a'
          '8ffaf60650d7ac00c9f25c982ab2b8fdcfca6286'
          'e285c60d401f91f282de6ad6b6f549e9f5e9ff1d')

prepare() {
  cd "$srcdir/squish-$pkgver"
  cp $srcdir/config .
  
  patch -Np0 -i $srcdir/gcc440.patch
  sed 's|ranlib|i486-mingw32-ranlib|' -i $srcdir/squish-$pkgver/Makefile
}
  
build() {
  cd "$srcdir/squish-$pkgver"

  VERBOSE=1 make || return 1
}

package() {
  cd "$srcdir/squish-$pkgver"

  install -Dm 644 squish.h $pkgdir/usr/i486-mingw32/include/squish.h
  install -Dm 644 libsquish.a $pkgdir/usr/i486-mingw32/lib/libsquish.a
  
  install -Dm 644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
