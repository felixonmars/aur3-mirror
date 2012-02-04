# $Id$
# Contributor: Hamlet <h@mlet.me>
#
# Original Maintainer: Eduardo Romero <eduardo@archlinux.org>
# Original Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=libgphoto2-nolimit
oldpkgname=libgphoto2
pkgver=2.4.10
pkgrel=1
pkgdesc="The core library of gphoto2.  This variation is only to increase the limit of files !"
arch=(i686 x86_64)
url="http://www.gphoto.org"
license=(LGPL)
conflicts=('libgphoto2')
provides=(libgphoto2=${pkgver})

depends=('libexif>=0.6.19' 'libjpeg>=8' 'gd' 'libtool>=2.4' 'libusb')
install=libgphoto2.install
options=('libtool')
source=(http://downloads.sourceforge.net/gphoto/${oldpkgname}-${pkgver}.tar.gz)
md5sums=('64951b07ad40b02117c1beee9caf2d4d')

build() {
  cd "${srcdir}/${oldpkgname}-${pkgver}"

  #Change the limit which cause "Fixed limit exceeded"
  sed -i "s#MAX_ENTRIES 1024#MAX_ENTRIES 8192#" libgphoto2/gphoto2-list.c

  udevscriptdir=/lib/udev ./configure --prefix=/usr --with-drivers=all --disable-static --disable-rpath
  LD_PRELOAD="" make
  make DESTDIR="${pkgdir}" install

  rm -f ${pkgdir}/usr/lib/libgphoto2/${pkgver}/*.a
  
  install -m755 -d "${pkgdir}/usr/share/hal/fdi/information/20thirdparty"
  install -m755 -d "${pkgdir}/lib/udev/rules.d"
  LD_LIBRARY_PATH="${pkgdir}/usr/lib${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH" \
  CAMLIBS="${pkgdir}/usr/lib/libgphoto2/${pkgver}" \
      "${pkgdir}/usr/lib/libgphoto2/print-camera-list" hal-fdi > \
      "${pkgdir}/usr/share/hal/fdi/information/20thirdparty/10-camera-libgphoto2.fdi"

  LD_LIBRARY_PATH="${pkgdir}/usr/lib${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH" \
  CAMLIBS="${pkgdir}/usr/lib/libgphoto2/${pkgver}" \
      "${pkgdir}/usr/lib/libgphoto2/print-camera-list" udev-rules version 136 group camera mode 0660 > \
      "${pkgdir}/lib/udev/rules.d/54-gphoto.rules"

  # Remove recursive symlink
  rm -f "${pkgdir}/usr/include/gphoto2/gphoto2"
}
