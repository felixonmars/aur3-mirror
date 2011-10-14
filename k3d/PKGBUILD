# $Id: PKGBUILD,v 1.5 2008/05/30 11:51:52 kth5 Exp $
# x86 Contributor: Gino Pezzin <pezzin@gmail.com>
pkgname=k3d
pkgver=0.8.0.1
pkgrel=1
pkgdesc="k-3d is a complete free-as-in-freedom 3D modeling, animation and rendering system."
url="http://www.k-3d.org/"
arch=('x86_64' 'i686')
license="GPL"
depends=('expat' 'libxml2' 'gtkmm' 'gtkglext' 'libsigc++' 'python' 'imagemagick' 'openexr' \
         'freetype2' 'libtiff' 'graphviz' 'mesa' 'libgnome')
makedepends=('pkgconfig' 'cmake' 'doxygen')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/k3d/${pkgname}-source-${pkgver}.tar.gz \
        k3d.desktop libpng.patch gtk_combobox.patch gcc-4.6.patch)

build() {
  cd ${srcdir}/${pkgname}-source-${pkgver}
  patch -Np1 -i ${srcdir}/libpng.patch
  patch -Np1 -i ${srcdir}/gcc-4.6.patch
  patch -Np1 -i ${srcdir}/gtk_combobox.patch

  mkdir ourbuild
  cd ourbuild
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr \
	-DSYSCONF_INSTALL_DIR=/etc \
	-DK3D_IMAGEMAGICK_INCLUDE_DIR=/usr/include/ImageMagick
  make || return 1
  make DESTDIR=${pkgdir} install
  install -D -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
md5sums=('28e506c42d609ae89ef18a393980deb1'
         '1ee5960bd6dc219a3ec186abfae1934c'
         '75a596105450842b4dd7eec77dc1c592'
         '1210a07b34fb25da41b2c2b918f27c8d'
         '62f17c529924b25722abad30aaa6f0b2')
