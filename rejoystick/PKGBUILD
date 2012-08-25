# Contributor: sh__

pkgname=rejoystick
pkgver=0.8.1
pkgrel=3
pkgdesc="A program that maps joystick events to keypresses"
url="http://rejoystick.sourceforge.net"
license=('GPL')
arch=(i686 x86_64)
depends=('libxtst' 'sdl' 'gtk2')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('43208b766a131e2725bfd72caf60a41d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|version.mk|\./version\.mk|' configure
  ./configure --prefix=/usr
  sed -i 's|-lgtk-x11-2.0|-lX11 -lgtk-x11-2.0|g' src/Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
