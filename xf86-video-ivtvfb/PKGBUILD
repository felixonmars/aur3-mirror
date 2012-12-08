# Contributor: Andreas Baumann <abaumann@yahoo.com>
# Maintainer:  Federico Cinelli <cinelli.federico@gmail.com>

pkgname=xf86-video-ivtvfb
pkgver=1.1.2
pkgrel=3
pkgdesc="xorg framebuffer driver for IVTV video cards"
arch=('i686')
url="http://ivtvdriver.org"
license=('GPL')
makedepends=('xorg-server-devel' 'pkgconfig')
depends=('xorg-server')
source=(http://dl.ivtvdriver.org/xf86-video-ivtv/archive/1.1.x/xf86-video-ivtv-$pkgver.tar.gz)
md5sums=('4a331ed8b4fe1d72ceaa7586c8babdd5')

build() {
  cd "$srcdir/xf86-video-ivtv-$pkgver"
  ./autogen.sh
  make
}
package() {
  make -C "$srcdir/_gitname-build" PREFIX=/usr DESTDIR=$pkgdir install
}
