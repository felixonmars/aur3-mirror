# $Id: PKGBUILD 140934 2011-10-20 05:43:55Z ibiru $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=mingw32-libsoup
pkgver=2.28.2
pkgrel=3
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('glib2' 'libxml2' 'sqlite3' 'intltool' 'glib-networking')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/libsoup/${pkgver%.*}/libsoup-${pkgver}.tar.bz2
"libsoup-mingw32.patch")
options=('!libtool' '!emptydirs')
md5sums=('31d7ad416005eed4b78f07ac01b6b9f0'
         'adde57336841479263d3fa492359b6ce')

build() {
  export CFLAGS="-O2 -pipe -march=i686 -mms-bitfields"
  export CPPFLAGS="-D_REENTRANT"
  export PKG_CONFIG_LIBDIR=/usr/i486-mingw32/lib/pkgconfig
  unset PKG_CONFIG_PATH
  unset LDFLAGS
  cd "${srcdir}/libsoup-${pkgver}"
  patch -p1 -i ${srcdir}/libsoup-mingw32.patch
  autoreconf
  ./configure --prefix=/usr/i486-mingw32 \
	  --sysconfdir=/etc \
	  --host=i486-mingw32 \
	  --build=$CHOST \
	  --enable-shared \
	  --localstatedir=/var --enable-static \
	  --without-gnome --disable-glibtest --disable-ssl
  make 
}

package_mingw32-libsoup() {
  pkgdesc="GNOME HTTP Library - base library"
  depends=('glib2' 'libxml2' 'glib-networking')

  cd "${srcdir}/libsoup-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd ${pkgdir}
  rm -f "${pkgdir}"/usr/lib/libsoup-gnome-2.4.*
  rm -f "${pkgdir}/usr/lib/pkgconfig/libsoup-gnome-2.4.pc"
  rm -rf "${pkgdir}/usr/include/libsoup-gnome-2.4"
  rm -f "${pkgdir}/usr/lib/girepository-1.0/SoupGNOME-2.4.typelib"

  find . -name '*.a' -o -name '*.dll' -o -name '*.exe' \
    | xargs -rtl1 i486-mingw32-strip -g
  find . -name "*.dll.a" -exec i486-mingw32-ranlib {} \;
  rm -rf usr/i486-mingw32/{share/{gtk-doc,man}}
}
