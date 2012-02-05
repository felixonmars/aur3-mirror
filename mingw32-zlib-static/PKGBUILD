# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: napa3um@gmail.com
pkgname=mingw32-zlib-static
pkgver=1.2.6
pkgrel=1
arch=('any')
license=('custom:zlib')
pkgdesc="A compression/decompression Library (mingw32)"
makedepends=('mingw32-gcc')
conflicts=('mingw32-zlib')
provides=('mingw32-zlib')
url="http://www.zlib.net/"
source=(http://www.zlib.net/zlib-$pkgver.tar.gz)
options=(!strip !buildflags)
md5sums=('618e944d7c7cd6521551e30b32322f4a')

build() {
  cd $srcdir/zlib-$pkgver

  sed -ie "s,dllwrap,i486-mingw32-dllwrap," win32/Makefile.gcc

  ./configure --prefix=/usr/i486-mingw32 --static
  make -f win32/Makefile.gcc \
    CC=i486-mingw32-gcc \
    AR=i486-mingw32-ar \
    RC=i486-mingw32-windres \
    STRIP=i486-mingw32-strip \
    IMPLIB=libz.dll.a \
    CFLAGS="-DNO_FSEEKO -Wall -O3"

  mkdir -p $pkgdir/usr/i486-mingw32/{lib,include}
  install -m 644 libz.a $pkgdir/usr/i486-mingw32/lib/
  install -m 644 zconf.h zlib.h $pkgdir/usr/i486-mingw32/include/
}
