# Maintainer: Matias De la Puente <mfpuente.ar@gmail.com>
pkgname=mingw32-gtksourceview2
pkgver=2.10.5
pkgrel=1
pkgdesc="A text widget adding syntax highlighting and more to GNOME"
arch=(any)
url="http://www.gnome.org"
license=('LGPL2.1')
depends=(mingw32-gtk2 mingw32-libxml2)
makedepends=(mingw32-gcc)
options=(!strip)
source=(ftp://ftp.gnome.org/pub/gnome/sources/gtksourceview/2.10/gtksourceview-$pkgver.tar.bz2)
sha256sums=('c585773743b1df8a04b1be7f7d90eecdf22681490d6810be54c81a7ae152191e')

build() {
  cd "$srcdir/gtksourceview-$pkgver"
  
  export PKG_CONFIG_LIBDIR=/usr/i486-mingw32/lib/pkgconfig
  unset PKG_CONFIG_PATH
  unset LDFLAGS
  
  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --build=$CHOST

  make
}

package() {
  cd "$srcdir/gtksourceview-$pkgver"

  make DESTDIR="$pkgdir/" install

  cd ${pkgdir}
  find . -name '*.a' -o -name '*.dll' -o -name '*.exe' \
    | xargs -rtl1 i486-mingw32-strip -g
  rm -rf usr/i486-mingw32/share/gtk-doc
}

