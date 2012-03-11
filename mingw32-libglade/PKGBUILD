pkgname=mingw32-libglade
pkgver=2.6.4
pkgrel=2
arch=(any)
pkgdesc="Allows you to load glade interface files in a program at runtime (mingw32)"
depends=(mingw32-runtime mingw32-gtk2)
makedepends=(mingw32-gcc)
options=(!strip !buildflags !libtool)
license=('LGPL')
url="http://www.jamesh.id.au/software/libglade/"
source=("http://ftp.gnome.org/pub/gnome/sources/libglade/2.6/libglade-${pkgver}.tar.bz2")
md5sums=('d1776b40f4e166b5e9c107f1c8fe4139')

build()
{
  cd "$srcdir/libglade-$pkgver"
  export CFLAGS="-O2 -mms-bitfields"
  export PKG_CONFIG_PATH="/usr/i486-mingw32/lib/pkgconfig/"
  unset LDFLAGS
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32
  make
}

package() {
  cd "$srcdir/libglade-$pkgver"
  mkdir -p "$pkgdir/usr/i486-mingw32/lib"
  make install DESTDIR=$pkgdir
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
  rm -rf "$pkgdir/usr/i486-mingw32/share/gtk-doc"
}
