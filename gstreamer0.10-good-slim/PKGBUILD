# Maintainer: Ananda Samaddar <ananda@samaddar.co.uk>

pkgname=gstreamer0.10-good-slim
pkgver=0.10.24
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('intltool' 'pkgconfig' 'gstreamer0.10-base>=0.10.28' 'libavc1394>=0.5.3-3' 'hal>=0.5.14' 'libiec61883>=1.2.0' 'libshout>=2.2.2' 'libdv>=1.0.0' 'flac>=1.2.1' 'wavpack>=4.50.1' 'taglib>=1.5' 'libv4l>=0.6.0' 'bzip2' 'gtk2>=2.18.6' 'imlib2>=1.4.2-4')
depends=('gstreamer0.10-base>=0.10.28' 'bzip2')
pkgdesc="GStreamer Multimedia Framework Good plugin libraries with reduced and no GNOME dependencies"
provides=('gstreamer0.10-good')
conflicts=('gstreamer0.10-bad<=0.10.17')
url="http://gstreamer.freedesktop.org/"
options=(!libtool !emptydirs)
source=(${url}/src/gst-plugins-good/gst-plugins-good-${pkgver}.tar.bz2)
sha256sums=('f274aac9c5b8efc66833c33cfad353209c785ac111465b37146680ee0de2d0be')

build() {
  cd "${srcdir}/gst-plugins-good-${pkgver}"
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental \
    --disable-schemas-install \
    --disable-esd \
    --disable-oss \
    --disable-aalib \
    --disable-gconf \
    --disable-libcaca \
    --with-package-name="GStreamer Good Plugins Slim" \
    --with-package-origin="Psychedelic Desi" || return 1

  make || return 1
  sed -e 's/gst sys ext/gst/' -i Makefile || return 1

  cd "${srcdir}/gst-plugins-good-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}


