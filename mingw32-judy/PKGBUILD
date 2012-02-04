# Maintainer: Ondrej Jirman <megous@megous.com>

_pkgname=Judy
pkgname=mingw32-judy
pkgver=1.0.4
pkgrel=1
arch=(i686)
pkgdesc="Judy (mingw32)"
depends=(mingw32-runtime)
makedepends=(mingw32-gcc)
options=(!strip)
license=('LGPL')
url="http://judy.sourceforge.net/"
source=(http://dl.sf.net/sourceforge/judy/$_pkgname-$pkgver.tar.gz
        $_pkgname-$pkgver-cross.patch)
md5sums=('7b03d4b016115ca15a5a96368a76cd10'
         '0e5bb5b23749f44e85e8209fbc1b27b1')

build()
{
  cd $startdir/src/$_pkgname-$pkgver

  export CFLAGS="$CFLAGS -mms-bitfields"

  cat $startdir/src/$_pkgname-$pkgver-cross.patch | patch -p1
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --build=$CHOST

  make HOST_CC=gcc -j1
  make install DESTDIR=$startdir/pkg

  cd $startdir/pkg
  find . -name '*.a' -o -name '*.dll' | xargs -rtl1 i486-mingw32-strip -g
  rm -rf usr/i486-mingw32/share/man
}
