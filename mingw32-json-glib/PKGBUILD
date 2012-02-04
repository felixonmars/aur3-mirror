pkgname=mingw32-json-glib
_pkgname=json-glib
pkgver=0.12.6
pkgrel=1
pkgdesc="JSON library built on GLib"
arch=('any')
url="http://live.gnome.org/JsonGlib"
license=('GPL')
depends=('mingw32-glib2')
#makedepends=('gobject-introspection')
makedepends=(mingw32-gcc)
options=('!libtool' '!strip')
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/0.12/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('4f670fc356e7a30121ade956e93236986952bb2601d6678e94eab7d87c8866ce')

build(){
  export CPPFLAGS="-D_REENTRANT"
  export PKG_CONFIG_LIBDIR=/usr/i486-mingw32/lib/pkgconfig
  unset PKG_CONFIG_PATH
  unset CFLAGS
  unset LDFLAGS
  cd ${srcdir}/${_pkgname}-${pkgver}

  ./configure \
    --prefix=/usr/i486-mingw32 \
    --host=i486-mingw32 \
    --build=$CHOST
  make
}

package(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
