# Maintainer: Rémy Oudompheng <remy@archlinux.org>

_pkgname=glibmm
pkgname=mingw32-${_pkgname}
pkgver=2.30.1
pkgrel=1
arch=(any)
pkgdesc="C++ interface for glib (mingw32)"
depends=('mingw32-glib2>=2.28' 'mingw32-libsigc++2.0>=2.2.5')
makedepends=(mingw32-gcc)
license=(LGPL)
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/2.30/${_pkgname}-$pkgver.tar.xz)
options=(!strip)
url="http://www.gtkmm.org/"
sha256sums=('69582b584666cab1dc4253faffee548054730bc058e28466871e6a954d7ff897')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  export CFLAGS="-march=i686 -O2 -pipe"
  export CXXFLAGS="$CFLAGS"
  export CPPFLAGS="$CPPFLAGS -D_REENTRANT"
  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig"
  unset LDFLAGS PKG_CONFIG_PATH

  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --build=$CHOST \
    --disable-documentation

  make
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install

  cd ${pkgdir}
  find . -name '*.a' -o -name '*.dll' -o -name '*.exe' \
    | xargs -rtl1 i486-mingw32-strip -g
}
