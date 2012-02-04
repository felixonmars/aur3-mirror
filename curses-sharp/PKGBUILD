# Maintainer: Your Name <youremail@domain.com>
pkgname=curses-sharp
pkgver=0.8
pkgrel=1
pkgdesc=".NET bindings for ncurses."
arch=('i686' 'x86_64')
url="http://curses-sharp.sourceforge.net"
license=('GPL')
depends=('mono' 'ncurses')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()

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
md5sums=('89937e3bba96c8dc16f168b9b3887e27')
