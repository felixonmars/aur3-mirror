# Contributor: Collin 'Fwirt' Skiles <sploopby at gmail dot com>
pkgname=sfxr-sdl
pkgver=1.2.1
pkgrel=1
pkgdesc="Random sound effect generator for games, etc."
arch=('i686' 'x86_64')
url="http://www.drpetter.se/project_sfxr.html"
license=('unknown')
depends=('gtk' 'sdl')
source=(http://www.drpetter.se/files/$pkgname-$pkgver.tar.gz)
md5sums=('794f18f5c527a344c7366687aa634d71')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install || return 1
}

