# Maintainer: Rémy Oudompheng <remy@archlinux.org>

_pkgname=cairomm
pkgname=mingw32-${_pkgname}
pkgver=1.10.0
pkgrel=2
pkgdesc="C++ bindings for cairo (mingw32)"
arch=(any)
url="http://www.cairographics.org"
license=('LGPL' 'MPL')
depends=('mingw32-cairo>=1.10' 'mingw32-libsigc++2.0>=2.2.3')
makedepends=(mingw32-gcc 'pkgconfig')
source=(http://www.cairographics.org/releases/${_pkgname}-${pkgver}.tar.gz)
options=(!strip)
sha1sums=('f08bf8a331067f0d1e876523f07238fba6b26b99')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export CFLAGS="-O2 -pipe -march=i686"
  export CXXFLAGS="$CFLAGS"
  export CPPFLAGS="$CPPFLAGS -D_REENTRANT"
  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig"
  unset PKG_CONFIG_PATH
  unset LDFLAGS

  sed -i -e 's/ps svg xlib xlib-render/ps svg/' configure
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --build=$CHOST \
    --disable-documentation \
    --enable-static --enable-shared

  make
}

package() {
  cd ${srcdir}/${_pkgname}-$pkgver
  make install DESTDIR=${pkgdir}

  cd ${pkgdir}
  find . -name '*.a' -o -name '*.dll' -o -name '*.exe' \
    | xargs -rtl1 i486-mingw32-strip -g
}
