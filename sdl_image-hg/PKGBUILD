# Maintainer: Pascal H. Grossé <pascal.grosse@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=sdl_image-hg
pkgver=367
pkgrel=1
pkgdesc="A simple library to load images of various formats as SDL 2.0 surfaces"
arch=('i686' 'x86_64')
url="http://www.libsdl.org/projects/SDL_image/"
license=('custom:zlib')
depends=('sdl-2.0' 'libpng' 'libjpeg' 'libtiff')
makedepends=('mercurial')
provides=('sdl2_image')
conflicts=('sdl2_image')
options=(!libtool)
source=('hg+http://hg.libsdl.org/SDL_image')
md5sums=('SKIP')

pkgver() {
  cd "$startdir/SDL_image"
  hg tip --template "{rev}"
}

build() {
  cd "$srcdir/SDL_image"

  rm -rf build
  sh autogen.sh
  mkdir build && cd build
  ../configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/SDL_image/build"

  make DESTDIR="$pkgdir/" install

  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sts=2 sw=2 et:
