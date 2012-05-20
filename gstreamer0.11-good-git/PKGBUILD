# Maintainer: Anton Novikov <random.plant@gmail.com>
# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>

_upver=0.11.22
pkgbase=('gstreamer0.11-good-git')
pkgname=gstreamer0.11-good-git
true && pkgname=('gstreamer0.11-good-git' 'gstreamer0.11-good-plugins-git')
pkgver=20120520
pkgrel=1
pkgdesc="GStreamer Multimedia Framework Good plugins"
arch=(i686 x86_64)
license=('LGPL')
makedepends=('pkgconfig' 'gstreamer0.11-base-git' 'xvidcore' 'libdca' 'bzip2' 'libdc1394'
'neon' 'faac' 'musicbrainz' 'faad2' 'libmms' 'libcdaudio' 'libmpcdec' 'mjpegtools' 'libdvdnav'
'libmodplug' 'jasper' 'liblrdf' 'libofa' 'soundtouch' 'libvdpau' 'schroedinger' 'libass'
'libvpx' 'gsm' 'libgme' 'rtmpdump' 'libsndfile' 'librsvg')
options=(!libtool)
url="http://gstreamer.freedesktop.org/"


_gitname=gst-plugins-good
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
    --with-package-name="GStreamer Good Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/"

  make CFLAGS="-Wno-error"
}


package_gstreamer0.11-good-git() {
  pkgdesc="GStreamer Multimedia Framework Good Plugin libraries (gst-plugins-good)"
  depends=('gstreamer0.11-base-git')
  conflicts=('gstreamer0.11-good')
  provides=("gstreamer0.11-good=${_upver}")
  groups=('gstreamer0.11-plugins')

  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  make -C ext DESTDIR="${pkgdir}" uninstall
  make -C sys DESTDIR="${pkgdir}" uninstall
}

package_gstreamer0.11-good-plugins-git() {
  pkgdesc="GStreamer Multimedia Framework Good Plugins (gst-plugins-good)"
  depends=("gstreamer0.11-good-git=${pkgver}" 'xvidcore' 'libdca' 'bzip2' 'libdc1394' 'neon' 'faac' 'musicbrainz' 'faad2' 'libmms' 'libcdaudio' 'libmpcdec' 'mjpegtools' 'libdvdnav' 'libmodplug' 'jasper' 'liblrdf' 'libofa' 'libvdpau' 'soundtouch' 'libass' 'schroedinger' 'libvpx' 'gsm' 'rtmpdump' 'libgme' 'libsndfile' 'librsvg')
  conflicts=('gstreamer0.11-good-plugins')
  provides=("gstreamer0.11-good-plugins=${_upver}")
  groups=('gstreamer0.11-plugins')
  install=gstreamer0.11-good-plugins.install

  cd "${srcdir}/build"

  make -C ext DESTDIR="${pkgdir}" install
  make -C sys DESTDIR="${pkgdir}" install
}
