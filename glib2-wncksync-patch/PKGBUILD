# $Id: PKGBUILD 79346 2010-05-03 10:44:26Z ibiru $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=glib2-wncksync-patch
_pkgname=glib2
pkgver=2.24.1
pkgrel=1
pkgdesc="Common C routines used by GTK+ 2.4 and other libs"
url="http://www.gtk.org/"
arch=(i686 x86_64)
license=('LGPL')
depends=('pcre>=8.02')
makedepends=('pkgconfig')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!libtool' '!docs')
source=(http://ftp.gnome.org/pub/GNOME/sources/glib/2.24/glib-${pkgver}.tar.bz2
        glib2.sh
        glib2.csh
        gio-wncksync.patch)

build() {
  cd ${srcdir}
  cd "${srcdir}/glib-${pkgver}"
  patch -Np0 -i ${srcdir}/gio-wncksync.patch || return 1
  ./configure --prefix=/usr --enable-static --enable-shared \
      --with-pcre=system --disable-fam || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

  install -d "${pkgdir}/etc/profile.d"
  install -m755 "${srcdir}/glib2.sh" "${pkgdir}/etc/profile.d/" || return 1
  install -m755 "${srcdir}/glib2.csh" "${pkgdir}/etc/profile.d/" || return 1

  chmod 755 ${pkgdir}/usr/bin/gtester-report || return 1
}

md5sums=('6a7db81c9a2cffe6a34dadb57d7ba2d2'
         '803017b365bd35dc20b092ce43b8c8c5'
         '90c7b830bef4baf225c2eb8b7ead0cab'
         '1224b871ffd8ce9931b0e673e5273d8a')
