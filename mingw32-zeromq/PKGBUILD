pkgname=mingw32-zeromq
pkgver=2.2
pkgrel=0
arch=(any)
pkgdesc="The socket library that acts as a concurrency framework (mingw32)"
license=(LGPL)
makedepends=('mingw32-gcc')
depends=('mingw32-runtime')
options=(!strip !buildflags)
url="http://www.zeromq.org/"
source=("http://download.zeromq.org/zeromq-$pkgver.$pkgrel.zip")
md5sums=('f95b6451b10fdd1416848bb3118c8380')

build()
{
  cd "${srcdir}/zeromq-$pkgver.$pkgrel"
  export CFLAGS="-march=i686 -O2 -pipe"
  export CXXFLAGS="$CFLAGS"
  export CPPFLAGS="$CPPFLAGS -D_REENTRANT"
  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig"

  unset LDFLAGS PKG_CONFIG_PATH
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --build=$CHOST \
    --enable-shared \
    --disable-static
    
  make
}

package() {
  cd "${srcdir}/zeromq-$pkgver.$pkgrel"
  make install DESTDIR=${pkgdir}

  cd "$pkgdir"
  find . -name '*.a'-o -name '*.dll' -o -name '*.exe' \
    | xargs -rtl1 i486-mingw32-strip -g
}
