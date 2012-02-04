# Contributor: Jan de Groot <jgc/archlinux/org>
# Maintainer: Hervé Cauwelier <herve/oursours/net>

pkgname=gstreamer0.10-timidity
pkgver=0.10.22
pkgrel=1
pkgdesc="GStreamer Multimedia Framework timidity plugin (from gst-plugins-bad)"
arch=('i686' 'x86_64')
license=('LGPL' 'GPL')
depends=('gstreamer0.10-base>=0.10.26' 'libtimidity')
makedepends=('pkgconfig')
url="http://gstreamer.freedesktop.org/"
options=(!libtool)
_relname=gst-plugins-bad
source=(${url}/src/${_relname}/${_relname}-${pkgver}.tar.bz2)
md5sums=('9a2acee1f386f71247003d0d7090fb1c')

build() {
  cd "${srcdir}/${_relname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --disable-valgrind \
    --enable-experimental --enable-external \
    --with-package-name="GStreamer Bad Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/" || return 1

  cd ext/timidity || return 1

  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
