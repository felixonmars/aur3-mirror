pkgname=mingw32-glib2-static
pkgver=2.30.2
pkgrel=3
arch=(any)
pkgdesc="Common C routines used by GTK+ 2.4 and other libs (mingw32, static)"
depends=(mingw32-runtime mingw32-gettext-static)
makedepends=(mingw32-gcc)
license=(LGPL)
url="http://www.gtk.org/"
source=(h"ttp://ftp.gnome.org/pub/gnome/sources/glib/2.30/glib-$pkgver.tar.bz2")
md5sums=('b40f3889e8d24e1b367763673ca6deb5')
options=(!strip !buildflags !libtool)

build()
{
  cd "$srcdir/glib-$pkgver"
    cat > win32.cache << EOF
glib_cv_long_long_format=I64
glib_cv_stack_grows=no
EOF

  export CFLAGS="-O2 -pipe -march=i686 -mms-bitfields"
  export CPPFLAGS="-D_REENTRANT"
  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig"
  unset PKG_CONFIG_PATH
  unset LDFLAGS
  PYTHON="/usr/bin/python2" \
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --cache-file=win32.cache \
    --enable-static \
    --disable-shared
  make
}

package() {
  cd "$srcdir/glib-$pkgver"
  make DESTDIR="$pkgdir" install

  cd ${pkgdir}
  rm -rf $pkgdir/usr/i486-mingw32/{share/{gtk-doc,man},lib/charset.alias}
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
