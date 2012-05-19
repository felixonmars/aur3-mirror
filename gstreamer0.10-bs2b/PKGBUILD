# Maintainer: boenki <boenki at gmx dot de>

pkgname=gstreamer0.10-bs2b
pkgver=0.4
pkgrel=1
pkgdesc="A crossfeed plugin for Gstreamer, using the bs2b library."
arch=('i686' 'x86_64')
url="https://github.com/lazka/gst-bs2b"
license=('LGPL2.1')
depends=('libbs2b' 'gstreamer0.10-base')
options=(!libtool !zipman)
source=(https://github.com/downloads/lazka/gst-bs2b/$pkgname-$pkgver.tar.gz)
md5sums=('a837eb0c4ffb9499246d71194e5a5c50')

build() {
  cd $pkgname-$pkgver
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}