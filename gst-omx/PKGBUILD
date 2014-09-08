# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=gst-omx
pkgver=1.2.0
pkgrel=1
pkgdesc="Gstreamer OpenMAX IL wrapper Plugin"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('gst-plugins-bad' 'mesa')
options=(!libtool)
source=(${url}/src/$pkgname/$pkgname-$pkgver.tar.xz)
md5sums=('d24e8c0153c35dfefee3e26b1c2c35f8')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --disable-static \
              --enable-experimental \
              --with-package-name="GStreamer OpenMAX IL wrapper Plugin (Archlinux)" \
              --with-package-origin="http://www.archlinux.org/" \
              --with-omx-target=generic
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
