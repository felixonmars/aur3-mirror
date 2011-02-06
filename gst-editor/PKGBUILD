# Maintainer: Chuck Atkins <chuckatkins at gmail dot com>
# Contributor: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: Maciej Ciemborowicz <pub at ciemborowicz dot pl>

pkgname=gst-editor
pkgver=0.10.3.2
pkgrel=1
pkgdesc="A graphical pipeline editor for the GStreamer multimedia framework."
arch=('i686' 'x86_64')
license=(LGPL)
url="http://code.google.com/p/gst-editor/"
groups=('multimedia')
conflicts=('gst-editor-0.10');
makedepends=('intltool' 'cvs')
depends=('gstreamer0.10>=0.10' 'goocanvas' )
source=(http://gst-editor.googlecode.com/files/gsteditor-${pkgver}.tar.gz)
md5sums=('85f8bc2b3302efd209101748b5a8669c')

build() {
  cd ${srcdir}/gsteditor-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}


