# Maintainer: Anton Novikov <random.plant@gmail.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

_upver=0.11.35
pkgbase=('gstreamer0.11-base')
pkgname=gstreamer0.11-base-git
true && pkgname=('gstreamer0.11-base-git' 'gstreamer0.11-base-plugins-git')
pkgver=20120520
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Base plugin libraries"
arch=(i686 x86_64)
license=('LGPL')
makedepends=('pkgconfig' 'gstreamer0.11-git' 'orc' 'libxv' 'alsa-lib' 'cdparanoia' 'libvisual' 'libvorbis' 'libtheora' 'pango' 'gobject-introspection')
options=(!libtool)
url="http://gstreamer.freedesktop.org/"
groups=('gstreamer')

_gitname=gst-plugins-base
_gitroot=git://anongit.freedesktop.org/gstreamer/${_gitname}
_gitbranch=0.11

build() {
  cd "${srcdir}"
  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull && cd ..
  else
    git clone --branch $_gitbranch --depth 1 $_gitroot
  fi

  rm -rf build
  cp -r ${_gitname} build
  cd build

  ./autogen.sh --noconfigure
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental --disable-gnome_vfs \
    --with-package-name="GStreamer Base Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/"

  make
}


package_gstreamer0.11-base-git() {
  pkgdesc="GStreamer Multimedia Framework Base plugin libraries"
  depends=('gstreamer0.11-git' 'orc' 'libxv' 'libsm' 'perl')
  conflicts=('gstreamer0.11-base')
  provides=("gstreamer0.11-base=${_upver}")

  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  make -C ext DESTDIR="${pkgdir}" uninstall
}

package_gstreamer0.11-base-plugins-git() {
  pkgdesc="GStreamer Multimedia Framework Base Plugins (gst-plugins-base)"
  depends=("gstreamer0.11-base-git=${pkgver}" 'alsa-lib' 'cdparanoia' 'libvisual' 'libvorbis' 'libtheora' 'pango')
  conflicts=('gstreamer0.11-base-plugins')
  provides=("gstreamer0.11-base-plugins=${_upver}")
  groups=('gstreamer0.11-plugins')

  cd "${srcdir}/build"
  make -C gst-libs DESTDIR="${pkgdir}" install
  make -C ext DESTDIR="${pkgdir}" install
  make -C gst-libs DESTDIR="${pkgdir}" uninstall
}
