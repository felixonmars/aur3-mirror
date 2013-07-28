pkgname=giflib5
pkgver=5.0.4
pkgrel=1
pkgdesc='Library for reading and writing gif images'
url='http://sourceforge.net/projects/giflib/'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libx11')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/giflib/giflib-$pkgver.tar.bz2)
md5sums=('da60935d07374de00a78c2f6f720c8f5')

build() {
  cd giflib-$pkgver
  ./configure --prefix=/usr --disable-static --program-suffix=5
  make
}

package() {
  cd giflib-$pkgver
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/include/gif_lib.h "$pkgdir"/usr/include/gif_lib5.h
}
