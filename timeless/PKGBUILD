# Maintainer: Travis Poppe <tlp@lickwid.net>
pkgname=timeless
pkgver=1.0.1
pkgrel=1
pkgdesc="Linux/SDL port of Tran's (aka Thomas Pytel) Timeless demo of 1994"
arch=('i686' 'x86_64')
url="http://www.linuxmotors.com/timeless/"
license=('GPL')
depends=('sdl' 'sdl_sound')
source=(http://www.linuxmotors.com/timeless/download/SDL_$pkgname-$pkgver.tgz)
md5sums=('5d80672d47e13be033095009d4566347')

build() {
  cd "$srcdir/SDL_$pkgname-$pkgver"
  sed -i 's|-lSDL_sound|-lSDL_sound -lm|g' Makefile
  make
}

package() {
  cd "$srcdir/SDL_$pkgname-$pkgver"
  install -Dm 755 timeless "${pkgdir}/usr/bin/timeless"
  install -Dm 644 README "${pkgdir}/usr/share/doc/timeless/README"
}
