# Maintainer: Thijs Vermeir <thijsvermeir@gmail.com>

_upver=0.11.22
pkgbase=('gstreamer0.11-bad-git')
pkgname=gstreamer0.11-bad-git
true && pkgname=('gstreamer0.11-bad-git' 'gstreamer0.11-bad-plugins-git')
pkgver=20120109
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Bad plugins"
arch=(i686 x86_64)
license=('LGPL')
makedepends=('pkgconfig' 'gstreamer0.11-base-git' 'xvidcore' 'libdca' 'bzip2' 'libdc1394'
'neon' 'faac' 'musicbrainz' 'faad2' 'libmms' 'libcdaudio' 'libmpcdec' 'mjpegtools' 'libdvdnav'
'libmodplug' 'jasper' 'liblrdf' 'libofa' 'soundtouch' 'libvdpau' 'schroedinger' 'libass'
'libvpx' 'gsm' 'libgme' 'rtmpdump' 'libsndfile' 'librsvg')
options=(!libtool)
url="http://gstreamer.freedesktop.org/"


_gitname=gst-plugins-bad
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
    --with-package-name="GStreamer Bad Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/"

  make
}


package_gstreamer0.11-bad-git() {
  pkgdesc="GStreamer Multimedia Framework Bad Plugin libraries (gst-plugins-bad)"
  depends=('gstreamer0.11-base-git')
  conflicts=('gstreamer0.11-bad')
  provides=("gstreamer0.11-bad=${_upver}")
  groups=('gstreamer0.11-plugins')

  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  make -C ext DESTDIR="${pkgdir}" uninstall
  make -C sys DESTDIR="${pkgdir}" uninstall
}

package_gstreamer0.11-bad-plugins-git() {
  pkgdesc="GStreamer Multimedia Framework Bad Plugins (gst-plugins-bad)"
  depends=("gstreamer0.11-bad-git=${pkgver}" 'xvidcore' 'libdca' 'bzip2' 'libdc1394' 'neon' 'faac' 'musicbrainz' 'faad2' 'libmms' 'libcdaudio' 'libmpcdec' 'mjpegtools' 'libdvdnav' 'libmodplug' 'jasper' 'liblrdf' 'libofa' 'libvdpau' 'soundtouch' 'libass' 'schroedinger' 'libvpx' 'gsm' 'rtmpdump' 'libgme' 'libsndfile' 'librsvg')
  conflicts=('gstreamer0.11-bad-plugins')
  provides=("gstreamer0.11-bad-plugins=${_upver}")
  groups=('gstreamer0.11-plugins')
  install=gstreamer0.11-bad-plugins.install

  cd "${srcdir}/build"

  make -C ext DESTDIR="${pkgdir}" install
  make -C sys DESTDIR="${pkgdir}" install
}
