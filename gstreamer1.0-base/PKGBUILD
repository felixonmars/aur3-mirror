# Maintainer: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=('gstreamer1.0-base')
pkgver=1.0.1
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('pkgconfig' 'gstreamer1.0>=1.0.1' 'orc' 'libxv' 'alsa-lib' 'cdparanoia' 'libvisual' 'libvorbis' 'libtheora' 'pango' 'gobject-introspection')
options=(!libtool !emptydirs)
url="http://gstreamer.freedesktop.org/"
source=(${url}/src/gst-plugins-base/gst-plugins-base-${pkgver}.tar.xz)

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

package() {
  pkgdesc="GStreamer Multimedia Framework Base plugin libraries"
  depends=('gstreamer1.0>=1.0.1' 'orc' 'libxv' 'alsa-lib' 'cdparanoia' 'libvisual' 'libvorbis' 'libtheora' 'pango')

  cd "${srcdir}/gst-plugins-base-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('75466452e4267fff86e322bc52ed0c962c6c3785f802230fe898cb09984b8de0')
