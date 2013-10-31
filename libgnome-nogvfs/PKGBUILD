# $Id: PKGBUILD 61825 2009-12-26 14:42:56Z jgc $ 
# Maintainer: Jan de Groot <jgc@archlinux.org>

# modified by Einar Lielmanis <einar@spicausis.lv>
#
# removed gvfs dependency: I can live with the missing-gvfs bugs, but cannot live with gvfs


pkgname=libgnome-nogvfs
pkgver=2.32.1
pkgrel=2
pkgdesc="Common libraries for GNOME for purists, without gvfs dependency"
provides=('libgnome=2.32.1.1', 'libgnome-data=2.32.1.1')
conflicts=('libgnome' 'libgnome-data')
arch=(i686 x86_64)
license=('LGPL')
depends=('glib2>=2.38.0' 'libbonobo>=2.32.0' 'gconf>=2.32.0')
makedepends=('glib2>=2.38.0' 'intltool' 'libbonobo>=2.32.0' 'gconf>=2.32.0' 'libcanberra>=0.25')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
install=libgnome.install
source=(
    http://ftp.gnome.org/pub/gnome/sources/libgnome/2.32/libgnome-${pkgver}.tar.bz2
    patch-port-glib2-2.38.diff
)


build() {
  cd "${srcdir}/libgnome-${pkgver}"
  patch -p1 < ${srcdir}/patch-port-glib2-2.38.diff
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static --disable-esd
  make
}
package_libgnome-nogvfs() {
  cd "${srcdir}/libgnome-${pkgver}"
  make -C libgnome DESTDIR="${pkgdir}" install
  make -C monikers DESTDIR="${pkgdir}" install

   for dir in doc gnome-data po schemas
   do
       make -C $dir GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
   done

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/libgnome.schemas" --domain libgnome-2.0 ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}

md5sums=('a4345e6087ae6195d65a4674ffdca559'
         'a713746e12eb952fb7a3609a62ca5533')
