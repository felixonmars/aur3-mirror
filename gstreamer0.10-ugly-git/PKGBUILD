# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

_upver=0.10.19
pkgbase=('gstreamer0.10-ugly-git')
pkgname=gstreamer0.10-ugly-git
true && pkgname=('gstreamer0.10-ugly-git' 'gstreamer0.10-ugly-plugins-git')
pkgver=20120501
pkgrel=1
pkgdesc="GStreamer Multimedia Framework ugly plugins"
arch=(i686 x86_64)
license=('LGPL')
makedepends=('pkgconfig' 'gstreamer0.10-base-git' 'libdvdread' 'lame' 'libmpeg2' 'a52dec'  'libmad' 'libsidplay' 'libcdio' 'x264' 'opencore-amr')
options=(!libtool)
url="http://gstreamer.freedesktop.org/"


_gitroot=git://anongit.freedesktop.org/gstreamer/${_gitname}
_gitname=gst-plugins-ugly

build() {
  cd "${srcdir}"
  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull && cd ..
  else
    git clone "${_gitroot}"
    cd "${_gitname}" && git checkout 0.10 && cd ..
  fi

  rm -rf build
  cp -r ${_gitname} build
  cd build

  ./autogen.sh --noconfigure
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental \
    --with-package-name="GStreamer Bad Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/"

  make
}


package_gstreamer0.10-ugly-git() {
  pkgdesc="GStreamer Multimedia Framework Bad Plugin libraries (gst-plugins-ugly)"
  depends=('gstreamer0.10-base-git')
  conflicts=('gstreamer0.10-ugly')
  provides=("gstreamer0.10-ugly=${_upver}")
  groups=('gstreamer0.10-plugins')

  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  make -C ext DESTDIR="${pkgdir}" uninstall
}

package_gstreamer0.10-ugly-plugins-git() {
  pkgdesc="GStreamer Multimedia Framework Bad Plugins (gst-plugins-ugly)"
  depends=("gstreamer0.10-ugly-git=${pkgver}" 'libdvdread' 'lame' 'libmpeg2' 'a52dec' 'libmad' 'libsidplay' 'libcdio' 'x264' 'opencore-amr')
  conflicts=('gstreamer0.10-ugly-plugins')
  provides=("gstreamer0.10-ugly-plugins=${_upver}")
  groups=('gstreamer0.10-plugins')

  cd "${srcdir}/build"
  make -C ext DESTDIR="${pkgdir}" install
}
