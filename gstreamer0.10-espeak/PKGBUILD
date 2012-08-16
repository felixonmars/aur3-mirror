# Maintainer: Ray Rashif <schivmeister@gmail.com>

pkgname=gstreamer0.10-espeak
_pkgname=gst-plugins-espeak
pkgver=0.3.3
pkgrel=2
pkgdesc="GStreamer plug-in for eSpeak"
arch=('i686' 'x86_64')
url="http://sugarlabs.org/go/DevelopmentTeam/gst-plugins-espeak/"
license=('LGPL')
depends=('espeak' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins')
options=('!libtool')
source=("http://download.sugarlabs.org/sources/honey/$_pkgname/$_pkgname-$pkgver.tar.bz2")
md5sums=('4e4a2d2363c50be72ed5d26a319439c3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  sed -i 's/g_value_set_boxed_take_ownership/g_value_take_boxed/' \
	  src/espeak.c

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
