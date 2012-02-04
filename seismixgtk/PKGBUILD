# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=seismixgtk
pkgver=0.1.4
pkgrel=1
pkgdesc="Seismix-gtk is a front-end for the Seismix modular music production system."
arch=(i686 x86_64)
url="http://ayyi.org/"
license=('GPL')
depends=('libyaml' 'librsvg' 'seed2' 'lash' 'clutter-gtk2' 'libgnomecanvas')
makedepends=('gtkglext')
options=('!libtool')
source=("http://ayyi.org/files/$pkgname-$pkgver.tar.gz")
md5sums=('905b1dc170466c84825fa6b472749580')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i "s|0400|0600|;70s|//||" ayyi/ayyi_shm.c
  sed -i "40s|^|//|;41s|//||" ayyi/ayyi_song.c

  # replace typedef with define for bool
  sed -i "s|typedef\( gboolean\)\( bool\).*|#define\2\1|" model/model_types.h

  # fix lash cflags var name
  sed -i "s|LASH_INCLUDES|LASH_CFLAGS|g" src/Makefile.*

  # add missing header for lash.c
  sed -i "5a#include \"arrange/utils.h\"" src/lash.c

  ./configure --prefix=/usr \
              --enable-webkit \
              --disable-osc \
              --enable-clutter \
              --enable-lash \
              --enable-seed \
              --enable-opengl
#              --enable-lv2 \ old api
  make CFLAGS="$CFLAGS `pkg-config --cflags gtkglext-1.0`" # missing gtkglext cflags
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
