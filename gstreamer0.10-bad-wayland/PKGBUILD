# Maintainer: Armin K. <krejzi at email dot com>

pkgname=gstreamer0.10-bad-wayland
pkgdesc="GStreamer Multimedia Framework Bad Plugin libraries (gst-plugins-bad)"
pkgver=0.10.23
pkgrel=1
arch=('i686' 'x86_64')
url="http://gstreamer.freedesktop.org/"
license=('LGPL' 'GPL')
groups=('gstreamer0.10-plugins')
provides=('gstreamer0.10-bad' 'gstreamer0.10-bad-plugins')
conflicts=('gstreamer0.10-bad' 'gstreamer0.10-bad-plugins')
depends=("gstreamer0.10-base>=0.10.36" 'xvidcore' 'libdca' 'bzip2' 'libdc1394' 'neon' 'faac' 'musicbrainz'
         'faad2' 'libmms' 'libcdaudio' 'libmpcdec' 'mjpegtools' 'libdvdnav' 'libmodplug' 'jasper' 'liblrdf'
         'libofa' 'libvdpau' 'soundtouch' 'libass' 'schroedinger' 'libvpx' 'gsm' 'rtmpdump' 'libgme'
         'libsndfile' 'librsvg' 'wildmidi' 'opus' 'wayland')
makedepends=('pkgconfig')
options=(!libtool !emptydirs)
install=gstreamer0.10-bad-wayland.install
source=("${url}/src/gst-plugins-bad/gst-plugins-bad-${pkgver}.tar.xz"
        "waylandsink.patch")
sha1sums=('dbdf3817513ae5432080feadf9a1f48b06824970'
          '91da23d194e887838ef043fe17dba9c1ab8cff10')

build() {
  cd "${srcdir}/gst-plugins-bad-${pkgver}"

  patch -Np1 -i "${srcdir}/waylandsink.patch"
  sed "s@AM_CONFIG_HEADER@AC_CONFIG_HEADERS@g" -i configure.ac

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental \
    --with-package-name="GStreamer Bad Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/"

  make
}

package() {
  cd "${srcdir}/gst-plugins-bad-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
