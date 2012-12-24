# $Id: PKGBUILD 79900 2012-11-14 16:17:23Z bluewind $
# Upstream Maintainer: Ionut Biru <ibiru@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>
_pkgbasename=gdk-pixbuf2
pkgname=libx32-$_pkgbasename
pkgver=2.26.5
pkgrel=1.1
pkgdesc="An image loading library (x32 ABI)"
arch=('x86_64')
url="http://www.gtk.org/"
license=('LGPL2')
depends=(libx32-glib2 libx32-libpng libx32-libtiff libx32-libjpeg libx32-libx11
         $_pkgbasename)
makedepends=(gcc-multilib-x32)
options=('!libtool' '!docs')
install=gdk-pixbuf2.install
source=(http://download.gnome.org/sources/gdk-pixbuf/${pkgver%.*}/gdk-pixbuf-${pkgver}.tar.xz)
sha256sums=('77696fd163bca95a130a1883dbd78d0ae4d782de2fc85a9a38556d13681f5c84')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd "${srcdir}/gdk-pixbuf-${pkgver}"

  ./configure --prefix=/usr  --libdir=/usr/libx32 \
    --without-libjasper \
    --with-x11 \
    --with-included-loaders=png
  make
}

package() {
  cd "${srcdir}/gdk-pixbuf-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/etc
  rm -rf "${pkgdir}"/usr/{include,share}

  cd "${pkgdir}"/usr/bin
  mv gdk-pixbuf-query-loaders gdk-pixbuf-query-loaders-x32
  rm gdk-pixbuf-pixdata
  rm gdk-pixbuf-csource
}

# vim:set ts=2 sw=2 et:
