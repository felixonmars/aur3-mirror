# Maintainer: stefan <mark@unserver.de>
# Based on work of adriano <adriano.src@gmail.com>
# and Eric Belanger <eric@archlinux.org>
# and Woody Gilk <woody@archlinux.org>

pkgname=gimp-devel-light
pkgver=2.8.6
pkgrel=1
pkgdesc="Fast and light mode of GNU Image Manipulation Program (Development Version)"
arch=('i686' 'x86_64')
url="http://www.gimp.org/"
license=('GPL')
depends=('gtk2>=2.14.4' 'libxpm>=3.5.7' 'libxmu>=1.0.4' 'dbus-glib>=0.76' 'desktop-file-utils' 'gegl' 'librsvg' 'libwebkit' 'babl' 'python')
makedepends=('intltool>=0.35.5' 'pkgconfig>=0.21')
options=('!libtool' '!makeflags')
conflicts=('gimp' 'gimp-devel')
provides=('gimp-devel' 'gimp')
install=${pkgname}.install
source=(ftp://ftp.gimp.org/pub/gimp/v${pkgver%.*}/gimp-${pkgver}.tar.bz2 linux.gpl)

build() {
  export PYTHON=/usr/bin/python2
  cd ${srcdir}/gimp-${pkgver}

# IMPORTANT !!!
# If you have more than one core, remove this from ./configure line(29)
# --disable-libtool-lock --disable-mp
# If you need printing support, remove
# --without-print

  ./configure --disable-mp --disable-libtool-lock --prefix=/usr --sysconfdir=/etc --without-print --disable-largefile --disable-nls --disable-glibtest --disable-gtktest --disable-alsatest --without-aa --without-gvfs --without-wmf --without-alsa --without-libcurl --without-hal --disable-gimp-console

  make || return 1
  make DESTDIR=${pkgdir} install-strip || return 1

  install -D -m644 ${srcdir}/linux.gpl \
    ${pkgdir}/usr/share/gimp/2.0/palettes/Linux.gpl || return 1

}

md5sums=('12b3fdf33d1f07ae79b412a9e38b9693'
         'bb27bc214261d36484093e857f015f38')
         