# Contributor: Jaroslaw Rosiek (jaroslaw.rosiek@interia.pl)
pkgname=mingw32-bzlib-static
pkgver=1.0.6
pkgrel=1
arch=(i686 x86_64)
pkgdesc="Bzlib (libbzip2) static library."
makedepends=('mingw32-gcc' 'mingw32-binutils')
conflicts=('mingw32-bzlib')
replaces=('mingw32-bzlib')
url="http://www.bzip.org/"
license=(custom)
source=(http://www.bzip.org/$pkgver/bzip2-$pkgver.tar.gz)
options=(!strip)

build()
{
  cd $srcdir/bzip2-$pkgver

  make CC=i486-mingw32-gcc AR=i486-mingw32-ar RANLIB=i486-mingw32-ranlib \
   "CFLAGS=-Wall -Winline -O2 -D_FILE_OFFSET_BITS=64" \
   libbz2.a
 
  mkdir -p $pkgdir/usr/i486-mingw32/{lib,include}
  install -m 644 -o 0 -g 0 libbz2.a $startdir/pkg/usr/i486-mingw32/lib/
  install -m 644 -o 0 -g 0 bzlib.h $startdir/pkg/usr/i486-mingw32/include/
}

md5sums=('00b516f4704d4a7cb50a1d97e6e8e15b')
