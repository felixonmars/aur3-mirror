# $Id: PKGBUILD 000001 2014-06-06 22:05:07 $
# Maintainer: Ferren Liu  <ferrenliu@maxtrys.com>

pkgname=gst-rtsp-server
pkgver=1.4.5
pkgrel=1
pkgdesc="GStreamer Multimedia Framework RTSP Server"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('gst-plugins-base')
makedepends=('gstreamer' 'speex' 'flac' 'python' 'gtk-doc')
options=(!emptydirs)
source=(${url}/src/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('3089254bd31b7c1f1cf2c034a3b3551f92878f9e3cab65cef3a901a04c0f1d37')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental --enable-gtk-doc \
    --with-package-name="GStreamer RTSP Server (Arch Linux)" \
    --with-package-origin="http://www.archlinux.org/"

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
