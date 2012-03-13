pkgname=mingw32-gtk2
pkgver=2.24.10
pkgrel=4
arch=(any)
pkgdesc="GTK+ is a multi-platform toolkit (v2) (mingw32)"
url="http://www.gtk.org/"
depends=('mingw32-runtime' 'mingw32-atk>=1.30' 'mingw32-pango>=1.20'
         'mingw32-glib2>=2.28' 'mingw32-cairo>=1.6'
         'mingw32-gdk-pixbuf2>=2.22')
makedepends=(mingw32-gcc)
options=(!strip !buildflags !libtool)
license=('LGPL')
backup=("usr/i486-mingw32/etc/gtk-2.0/im-multipress.conf")
source=("http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${pkgver}.tar.xz")
sha256sums=('ea56e31bb9d6e19ed2e8911f4c7ac493cb804431caa21cdcadae625d375a0e89')

build() {
  cd "${srcdir}/gtk+-${pkgver}"
  export CFLAGS="-O2 -mms-bitfields"
  export CXXFLAGS="${CFLAGS}"
  export PKG_CONFIG_LIBDIR="/usr/i486-mingw32/lib/pkgconfig/"
  unset LDFLAGS PKG_CONFIG_PATH
  mkdir -p build && cd build
  ../configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --with-gdktarget=win32 \
    --disable-modules \
    --disable-cups \
    --with-included-loaders=png,bmp,ico,pnm,xpm
  make
}

package() {
    cd "${srcdir}/gtk+-${pkgver}/build"
    mkdir -p "${pkgdir}/usr/i486-mingw32/lib"
    make DESTDIR="${pkgdir}" install

    cd ${pkgdir}
    i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
    i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
    i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
    i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/lib/gtk-2.0/2.10.0/engines/*.dll
    i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/gtk-2.0/2.10.0/engines/*.a
    i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/lib/gtk-2.0/modules/*.dll
    i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/gtk-2.0/modules/*.a
    rm $pkgdir/usr/i486-mingw32/lib/*.def
    rm -rf "$pkgdir/usr/i486-mingw32/share/man"
}
