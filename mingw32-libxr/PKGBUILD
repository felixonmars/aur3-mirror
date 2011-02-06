# Maintainer: Ondrej Jirman <megous@megous.com>

pkgname=mingw32-libxr
pkgver=0.9.94
pkgrel=1
pkgdesc="XML-RPC library (mingw32)"
arch=(i686)
depends=('mingw32-glib2' 'mingw32-libxml2' 'mingw32-openssl')
makedepends=(mingw32-gcc)
options=(!strip)
license=(LGPL)
url="http://oss.zonio.net"
source=(http://oss.zonio.net/releases/libxr/libxr-$pkgver.tar.bz2)
md5sums=('fb5a6b1d6fe0f1dc3659d6aa5d9f8f27')

build()
{
  cd $startdir/src/libxr-$pkgver

  export CFLAGS="-O2 -mms-bitfields"
  export PKG_CONFIG_PATH="/usr/i486-mingw32/lib/pkgconfig/"
  
  sed -i 's/tests//g' Makefile.in

  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --build=$CHOST \
    --disable-json || exit 1

  make || exit 1
  make DESTDIR=$startdir/pkg install || exit 1

  cd $startdir/pkg
  find . -name '*.a' -o -name '*.dll' -o -name '*.exe'| xargs -rtl1 i486-mingw32-strip -g
}
