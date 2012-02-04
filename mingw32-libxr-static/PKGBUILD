# Maintainer: napa3um@gmail.com

pkgname=mingw32-libxr-static
pkgver=1.0
pkgrel=6
pkgdesc="Client/server XML-RPC library for C"
arch=(i686 x86_64)
depends=('mingw32-glib2-static' 'mingw32-libxml2-static' 'mingw32-openssl-static')
makedepends=('mingw32-gcc')
license=(LGPL)
url="http://oss.zonio.net/libxr.htm"
source=(http://oss.zonio.net/releases/libxr/libxr-$pkgver.tar.bz2)
md5sums=('4c8347abe6b5a17b3f6fd194e418d5d7')
options=(!strip)

build()
{
  cd $srcdir/libxr-$pkgver

  export PKG_CONFIG_PATH=/usr/i486-mingw32/lib/pkgconfig
LDFLAGS=''
  ./configure --disable-json --host=i486-mingw32 --prefix=/usr/i486-mingw32 --enable-static --disable-shared || return 1
  sed -i 's/tests docs//g' Makefile
  sed -i 's/#include "xr-http.h"/#include "xr-http.h"\r\n#include <winsock2.h>/g' lib/xr-http.c
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  cd $pkgdir
  rm -rf usr/i486-mingw32/share
}
