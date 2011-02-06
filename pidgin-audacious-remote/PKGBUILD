# Maintainer: Radu Andries <admiral0@tuxfamily.org>
pkgname=pidgin-audacious-remote
pkgver=0.5
pkgrel=1
pkgdesc="Pidgin-Audacious-Remote is a plug-in for Pidgin 2; it creates, in conversation and chat windows, some controls that allow two-way interaction with Audacious media player."
arch=(i686 x86_64 arm)
url="http://pidginaudacious.sourceforge.net/"
license=('GPL')
depends=(pidgin audacious)
source=(http://pidginaudacious.sourceforge.net/files/pidgin-audacious-remote-$pkgver.tar.bz2)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('c85dbf32d0a4c5de67b518a0fde76480')
