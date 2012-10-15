# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=vittk
pkgver=1.3
pkgrel=3
pkgdesc="A character-based full screen terminal interface to taskwarrior."
arch=('i686' 'x86_64')
url="http://taskwarrior.org/wiki/taskwarrior/Vittk"
license=('GPL')
depends=('task>=1.9.3' 'task<2.1.0' 'tcl' 'tk' 'xorg-server')
source=(http://taskwarrior.org/download/$pkgname-$pkgver.tar.gz)
sha256sums=('da672b7845855211644a5a0771500cffb1756c579d57dc33e2dabc5b86d8a5dd')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's: @prefix@: $(DESTDIR)@prefix@:g' Makefile.in
  ./configure --prefix="/usr/" || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR=$pkgdir
}
