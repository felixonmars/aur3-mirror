# Contributor: David Spicer <azleifel at googlemail.com>

pkgname=gstreamer0.10-rtsp
_source_pkgname=gst-rtsp
pkgver=0.10.8
pkgrel=2
pkgdesc="An RTSP server based on GStreamer with Python and Vala bindings"
arch=('i686' 'x86_64')
url="http://people.freedesktop.org/~wtay/"
license=('GPL')
depends=('gstreamer0.10-base')
makedepends=('pkg-config' 'gstreamer0.10-python' 'gtk-doc' 'vala')
optdepends=('gstreamer0.10-python: To utilise the Python bindings'
            'vala: To utilise the Vala bindings')
options=(!libtool)
source=(http://people.freedesktop.org/~wtay/${_source_pkgname}-${pkgver}.tar.bz2
        PYGOBJECT_REQ.patch)
md5sums=('b511af07000595f63c3a705946221643'
         '57db8b58615cc73ba619f802762950eb')

build() {
  cd "${srcdir}/${_source_pkgname}-${pkgver}"

  #
  # BUILD
  #
  for _file in docgen.py h2def.py mergedefs.py mkskel.py scmexpr.py; do
     sed -i -e '1c#!/usr/bin/env python2' bindings/python/codegen/${_file}
  done
  patch -Np1 -i "${srcdir}/PYGOBJECT_REQ.patch"

  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --enable-gtk-doc --disable-valgrind --disable-debug --enable-introspection=no
  make
  make DESTDIR="${pkgdir}" install
  
  # Install documents
  install -D -m644 docs/README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
