# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgname=mingw32-fontconfig
pkgver=2.8.0
pkgrel=2
arch=(any)
pkgdesc="A library for configuring and customizing font access (mingw32)"
depends=(mingw32-runtime 'mingw32-freetype>=2.3.11' 'mingw32-expat>=2.0.1')
makedepends=(mingw32-gcc)
options=(!strip)
url="http://fontconfig.org"
source=(http://fontconfig.org/release/fontconfig-$pkgver.tar.gz)
license=('LGPL')
md5sums=('77e15a92006ddc2adbb06f840d591c0e')

build()
{
  cd "$srcdir/fontconfig-$pkgver"

  export CFLAGS="$CFLAGS -mms-bitfields"
  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig/"
  unset LDFLAGS PKG_CONFIG_PATH
  
  sed -i 's/$(DESTDIR)$(fc_cachedir)//' Makefile.in

  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --build=$CHOST \
    --with-arch=x86 \
    --with-freetype-config=/usr/i486-mingw32/bin/freetype-config

  make
}

package() {
  cd "$srcdir/fontconfig-$pkgver"
  make -j1 install DESTDIR="$pkgdir"

  cd "$pkgdir"
  find . -name '*.a' -o -name '*.dll' -o -name '*.exe' \
    | xargs -rtl1 i486-mingw32-strip -g
  rm -rf usr/i486-mingw32/share
}
