# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

_upver=0.11.18
pkgbase=('gstreamer0.11-ugly-git')
pkgname=gstreamer0.11-ugly-git
true && pkgname=('gstreamer0.11-ugly-git' 'gstreamer0.11-ugly-plugins-git')
pkgver=20120520
pkgrel=1
pkgdesc="GStreamer Multimedia Framework ugly plugins"
arch=(i686 x86_64)
license=('LGPL')
makedepends=('pkgconfig' 'gstreamer0.11-base-git' 'libdvdread' 'lame' 'libmpeg2' 'a52dec'  'libmad' 'libsidplay' 'libcdio' 'x264' 'opencore-amr')
options=(!libtool)
url="http://gstreamer.freedesktop.org/"


_gitname=gst-plugins-ugly
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
    --disable-static --enable-experimental \
    --with-package-name="GStreamer Ugly Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/"

  make
}


package_gstreamer0.11-ugly-git() {
  pkgdesc="GStreamer Multimedia Framework Ugly Plugin libraries (gst-plugins-ugly)"
  depends=('gstreamer0.11-base-git')
  conflicts=('gstreamer0.11-ugly')
  provides=("gstreamer0.11-ugly=${_upver}")
  groups=('gstreamer0.11-plugins')

  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  make -C ext DESTDIR="${pkgdir}" uninstall
}

package_gstreamer0.11-ugly-plugins-git() {
  pkgdesc="GStreamer Multimedia Framework Ugly Plugins (gst-plugins-ugly)"
  depends=("gstreamer0.11-ugly-git=${pkgver}" 'libdvdread' 'lame' 'libmpeg2' 'a52dec' 'libmad' 'libsidplay' 'libcdio' 'x264' 'opencore-amr')
  conflicts=('gstreamer0.11-ugly-plugins')
  provides=("gstreamer0.11-ugly-plugins=${_upver}")
  groups=('gstreamer0.11-plugins')

  cd "${srcdir}/build"
  make -C ext DESTDIR="${pkgdir}" install
}
