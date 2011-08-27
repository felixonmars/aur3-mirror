# Maintainer: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: Sigurd H Jakobsen <sigurd.jakobsen@gmail.com>

pkgname=libplayer
pkgver=2.0.1
pkgrel=1
pkgdesc="A multimedia A/V abstarction layer API"
arch=('i686' 'x86_64')
url="http://libplayer.geexbox.org"
license=('LGPL')
source=(http://libplayer.geexbox.org/releases/$pkgname-$pkgver.tar.bz2)
md5sums=('9ecc0564fef4a20f230ea0204079abf4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --disable-gstreamer --enable-xlib-hack
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
