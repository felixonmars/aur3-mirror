# Maintainer: Fellpe Contreras <felipe.contreras at gmail dot com>
 
pkgname=gst-av
pkgver=0.8.1
pkgrel=1
pkgdesc="GStreamer libav plug-in"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gst-av/"
license=('LGPL')
depends=('gstreamer0.10-base' 'ffmpeg')
makedepends=('pkgconfig')
source=(http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.xz)
sha1sums=('f31c18c05c99f11f156edea79a002076172c74b7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
