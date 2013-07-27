# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=sdl_ttf-hg
pkgver=249
pkgrel=1
pkgdesc="A library that allows you to use TrueType fonts in your SDL 2.0 applications"
arch=('i686' 'x86_64')
url="http://www.libsdl.org/projects/SDL_ttf/"
license=('custom')
depends=('sdl-2.0' 'freetype2')
makedepends=('mercurial')
options=(!libtool !staticlibs)
source=('hg+http://hg.libsdl.org/SDL_ttf')
sha1sums=('SKIP')

pkgver() {
  cd "$startdir/SDL_ttf"
  hg tip --template "{rev}"
}

build() {
  cd "$srcdir/SDL_ttf"

  ./autogen.sh
  rm -rf build && mkdir build && cd build
  ../configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/SDL_ttf/build"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/SDL_ttf/COPYING.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
