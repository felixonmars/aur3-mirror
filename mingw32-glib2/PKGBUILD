pkgname=mingw32-glib2
pkgver=2.38.0
pkgrel=1
arch=(any)
pkgdesc="Common C routines used by GTK+ and other libs (mingw32)"
depends=(mingw32-runtime mingw32-gettext mingw32-zlib mingw32-libffi)
makedepends=(mingw32-gcc python2 automake)
license=(LGPL)
options=(!strip)
url="http://www.gtk.org/"
source=(http://ftp.gnome.org/pub/GNOME/sources/glib/${pkgver%.*}/glib-$pkgver.tar.xz
        "revert-warn-glib-compile-schemas.patch"
        "0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch"
        "glib-send-log-messages-to-correct-stdout-and-stderr.patch"
        "glib-prefer-constructors-over-DllMain.patch")
md5sums=('SKIP'
	'cde8e1a9d18918be0d90af67a981f184'
	'c08c41118f5318d10f326c7c30e1a33a'
	'7b065f9bc154bf996523974a698b24de'
        '46969e815f3ab19582ba33667a52048b')

prepare() {
  cd "$srcdir/glib-$pkgver"

  patch -Np1 -i $srcdir/0001-Use-CreateFile-on-Win32-to-make-sure-g_unlink-always.patch
  patch -Np0 -i $srcdir/glib-send-log-messages-to-correct-stdout-and-stderr.patch
  patch -Np1 -i $srcdir/glib-prefer-constructors-over-DllMain.patch
  patch -Rp1 -i $srcdir/revert-warn-glib-compile-schemas.patch
}

build()
{
  cd "$srcdir/glib-$pkgver"

cat > win32.cache << EOF
glib_cv_long_long_format=I64
glib_cv_stack_grows=no
EOF

  export CFLAGS="-O2 -g -pipe -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS="-O2 -g -pipe -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig"
  unset PKG_CONFIG_PATH
  unset LDFLAGS
  
  ./autogen.sh
  
  PYTHON="/usr/bin/python2" \
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --target=i486-mingw32 \
    --build=${CHOST} \
    --cache-file=win32.cache
  
  make
}

package() {
  cd "$srcdir/glib-$pkgver"
  make DESTDIR="$pkgdir" install

  cd ${pkgdir}
  rm -rf $pkgdir/usr/i486-mingw32/{share/{gtk-doc,man},lib/charset.alias}
  rm $pkgdir/usr/i486-mingw32/lib/*.def
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}

