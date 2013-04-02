# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=libubuntuone
pkgver=4.1.2
pkgrel=1
pkgdesc="This library contains GTK widgets needed for integration of Ubuntu One functionalities into GTK applications"
arch=('i686' 'x86_64')
url="https://launchpad.net/libubuntuone"
license=('LGPL')
depends=('libwebkit3' 'libsoup-gnome' 'ubuntuone-client' 'liboauth')
makedepends=('intltool' 'gobject-introspection')
options=('!libtool')
source=(http://launchpad.net/libubuntuone/stable-4-2/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('278d81e83b73f1e456c5aa33c9f4b76d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
