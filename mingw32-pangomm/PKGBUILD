# Maintainer: Rémy Oudompheng <remy@archlinux.org>

_pkgname=pangomm
pkgname=mingw32-${_pkgname}
pkgver=2.28.4
pkgrel=1
arch=(any)
license=('LGPL')
pkgdesc="C++ bindings for pango (mingw32)"
depends=('mingw32-pango>=1.23.0' 'mingw32-glibmm>=2.14.1'
         'mingw32-cairomm>=1.2.2')
makedepends=(mingw32-gcc 'pkgconfig')
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/2.28/${_pkgname}-${pkgver}.tar.xz)
options=(!strip)
url="http://gtkmm.sourceforge.net/"
sha256sums=('778dcb66a793cbfd52a9f92ee5a71b888c3603a913fc1ddc48a30204de6d6c82')

build() {
  cd ${srcdir}/${_pkgname}-$pkgver

  export CFLAGS="-O2 -pipe -march=i686"
  export CXXFLAGS="$CFLAGS"
  export CPPFLAGS="$CPPFLAGS -D_REENTRANT"
  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig"
  unset PKG_CONFIG_PATH
  unset LDFLAGS

  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --build=$CHOST \
    --disable-documentation \
    --enable-static

  make
}

package() {
  cd "${srcdir}/${_pkgname}-$pkgver"
  make DESTDIR="${pkgdir}" install

  cd ${pkgdir}
  find . -name '*.a' -o -name '*.dll' -o -name '*.exe' \
    | xargs -rtl1 i486-mingw32-strip -g
}
