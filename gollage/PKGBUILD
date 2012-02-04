# Contributor: Daniel Isenmann <daniel [at] archlinux.org>
pkgname=gollage
pkgver=0.3
pkgrel=1
pkgdesc="GTK+ collage, in short gollage, is a program to generate photo collages with a Polaroid photo frame"
arch=('i686' 'x86_64')
url="http://gollage.sourceforge.net"
license=('GPL')
depends=('libglade' 'imagemagick' 'gtk2')
makedepends=('pkgconfig')
source=(http://download.sourceforge.net/sourceforge/gollage/$pkgname-$pkgver.tar.gz)
md5sums=('eecf6df0fa8199b7dafd673dd6e03641')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
