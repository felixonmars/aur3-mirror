# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: lh <jarryson@gmail.com>

pkgname=leafget
pkgver=0.0.50
pkgrel=1
pkgdesc="A GTK+ download manager"
arch=('i686' 'x86_64')
url="http://leafget.googlecode.com/"
license=('GPL')
depends=('gtk2' 'libsigc++2.0')
makedepends=('intltool>=0.35.0' 'pkgconfig>=0.9.0')
options=('!docs')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('d9f003b11781cf563478e3761f2cb015')

build() {
  cd "$srcdir/$pkgname"
  sed -i 's/gnome-talk.png/leafget/' $pkgname.desktop.in
  sed -i '1i\#include <sys/stat.h>' src/appcore.cpp
  sed -i '1i\#include <sys/unistd.h>' src/socket.cpp
  ./configure --prefix=/usr --docdir=/usr/share/doc
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 data/shamrock.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
