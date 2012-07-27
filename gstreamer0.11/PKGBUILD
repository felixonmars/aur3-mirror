# $Id: PKGBUILD 134230 2011-08-02 16:10:38Z jgc $
# Maintainer: Thijs Vermeir <thijsvermeir@gmail.com>

pkgname=gstreamer0.11
pkgver=0.11.92
pkgrel=1
pkgdesc="GStreamer Multimedia Framework"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('libxml2' 'glib2')
optdepends=('sh: feedback script')
makedepends=('intltool' 'pkgconfig' 'gtk-doc' 'gobject-introspection')
options=('!libtool')
source=(${url}/src/gstreamer/gstreamer-${pkgver}.tar.xz)

build() {
  cd "${srcdir}/gstreamer-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib \
    --with-package-name="GStreamer (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/" \
    --enable-gtk-doc --disable-static
  make
}

check() {
  cd "${srcdir}/gstreamer-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/gstreamer-${pkgver}"
  make DESTDIR="${pkgdir}" install

  #Remove unversioned gst-* binaries to get rid of conflicts
  cd "${pkgdir}/usr/bin"
  for bins in `ls *-0.10`; do
    rm -f ${bins/-0.10/}
  done
}
md5sums=('18afb50f6a508ac59dca694882091e66')
