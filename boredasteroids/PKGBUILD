# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=boredasteroids
pkgver=1.0
pkgrel=1
pkgdesc="Asteroids game, uses SDL"
arch=('x86_64' 'i686')
url="http://www.reddit.com/r/programming/comments/ypbus/asteroids_in_under_600_lines_of_common_lisp_uses/c5y2y8w"
license=('unknown')
depends=('sdl' 'sdl_gfx' 'sdl_ttf' 'ttf-freefont')
source=("main.cpp::http://pastebin.com/raw.php?i=W51FFiA3")
sha256sums=('9867963ecf64a1ed5acee79ea6e4352112d54995d89f443b6b22acb391a9b1e4')

build() {
  cd "$srcdir"
  sed -i 's:font.ttf:/usr/share/fonts/TTF/FreeMono.ttf:' main.cpp
  g++ -O2 main.cpp -o main `pkg-config sdl SDL_ttf SDL_gfx --libs --cflags`
}

package() {
  cd "$srcdir"
  install -Dm755 main "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
