# Author: RetroX <classixretrox@gmail.com>
pkgname=mingw32-dlfcn
pkgver=r19
pkgrel=2
pkgdesc="A wrapper for dlfcn to the Win32 API (mingw32)"
arch=(any)
url="http://code.google.com/p/dlfcn-win32"
license=('LGPL')
depends=('mingw32-runtime')
makedepends=('mingw32-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://dlfcn-win32.googlecode.com/files/dlfcn-win32-${pkgver}.tar.bz2"
        'dlfcn-fix-cplusplus-linkage.patch')
md5sums=('6e321b36ee289179777bab07dcfe5510'
         'd8f36510edea5a2baac68eb5d33da1f4')
         
prepare () {
  cd "$srcdir/dlfcn-win32-$pkgver"
  patch -p0 -i "$srcdir"/dlfcn-fix-cplusplus-linkage.patch
}

build()
{
  cd "$srcdir/dlfcn-win32-$pkgver"
  unset LDFLAGS
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --libdir=/usr/i486-mingw32/lib \
    --incdir=/usr/i486-mingw32/include \
    --enable-shared \
    --enable-static \
    --cross-prefix=i486-mingw32-
  make
}

package() {
  cd "$srcdir/dlfcn-win32-$pkgver"
  make DESTDIR="$pkgdir" install
  i486-mingw32-strip -x -g "$pkgdir"/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g "$pkgdir"/usr/i486-mingw32/lib/*.a
}
