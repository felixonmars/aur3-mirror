# Maintainer: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=('gstreamer0.11-base')
pkgver=0.11.1
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('pkgconfig' 'gstreamer0.11>=0.11.0' 'orc' 'libxv' 'alsa-lib' 'cdparanoia' 'libvisual' 'libvorbis' 'libtheora' 'pango' 'gobject-introspection')
options=(!libtool !emptydirs)
url="http://gstreamer.freedesktop.org/"
source=(${url}/src/gst-plugins-base/gst-plugins-base-${pkgver}.tar.bz2)

build() {
  cd "${srcdir}/gst-plugins-base-${pkgver}"
  sed -i '/AC_PATH_XTRA/d' configure.ac
  autoreconf
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental --disable-gnome_vfs \
    --with-package-name="GStreamer Base Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/"

  make || return 1
}

package_gstreamer0.11-base() {
  pkgdesc="GStreamer Multimedia Framework Base plugin libraries"
  depends=('gstreamer0.11>=0.11.0' 'orc' 'libxv' 'alsa-lib' 'cdparanoia' 'libvisual' 'libvorbis' 'libtheora' 'pango')

  cd "${srcdir}/gst-plugins-base-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

md5sums=('b4ecf15ef1eaf24a1b8c0b004c565360')
