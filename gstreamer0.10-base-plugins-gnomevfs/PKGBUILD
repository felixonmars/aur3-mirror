# $Id: PKGBUILD 153257 2012-03-12 15:48:41Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=('gstreamer0.10-base-plugins-gnomevfs')
pkgdesc="GStreamer Multimedia Framework Base Plugins (gst-plugins-base) with gnome-vfs support enabled"
provides=('gstreamer0.10-base-plugins=0.10.36')
pkgver=0.10.36
pkgrel=2
arch=('i686' 'x86_64')
license=('LGPL')
depends=("gstreamer0.10-base" 'alsa-lib' 'cdparanoia' 'libvisual' 'libvorbis' 'libtheora' 'pango')
replaces=('gstreamer0.10-alsa' 'gstreamer0.10-theora' 'gstreamer0.10-libvisual' 'gstreamer0.10-pango' 'gstreamer0.10-cdparanoia' 'gstreamer0.10-vorbis' 'gstreamer0.10-ogg')
conflicts=('gstreamer0.10-alsa' 'gstreamer0.10-theora' 'gstreamer0.10-libvisual' 'gstreamer0.10-pango' 'gstreamer0.10-cdparanoia' 'gstreamer0.10-vorbis' 'gstreamer0.10-ogg' 'gstreamer0.10-base-plugins')
groups=('gstreamer0.10-plugins')
makedepends=('pkgconfig' 'gstreamer0.10>=0.10.35' 'orc' 'libxv' 'alsa-lib' 'cdparanoia' 'libvisual' 'libvorbis' 'libtheora' 'pango' 'gobject-introspection')
options=(!libtool !emptydirs)
url="http://gstreamer.freedesktop.org/"
source=(${url}/src/gst-plugins-base/gst-plugins-base-${pkgver}.tar.xz)
sha256sums=('1fe45c3894903001d4d008b0713dab089f53726dcb5842d5b40c2595a984e64a')

build() {
  cd "${srcdir}/gst-plugins-base-${pkgver}"
  # Now it builds, unlike the pacakge currently sitting in extra.
  # Params from here: https://projects.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/gstreamer0.10-good&id=d8e837a1e8e6e50779915b749adb1dccb5a62184
  sed -i '/AC_PATH_XTRA/d' configure.ac
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental \
    --with-package-name="GStreamer Base Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/"

  make
  sed -e 's/^SUBDIRS_EXT =.*/SUBDIRS_EXT =/' -i Makefile
}

check() {
  cd "${srcdir}/gst-plugins-base-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/gst-plugins-base-${pkgver}"
  make -C gst-libs DESTDIR="${pkgdir}" install
  make -C ext DESTDIR="${pkgdir}" install
  make -C gst-libs DESTDIR="${pkgdir}" uninstall
}
