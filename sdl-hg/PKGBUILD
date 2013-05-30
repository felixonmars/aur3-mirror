# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=sdl-hg
pkgver=7240
pkgrel=2
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (mercurial version)"
arch=('i686' 'x86_64')
url="http://www.libsdl.org"
license=('custom:zlib')
makedepends=('mercurial')
provides=('sdl-2.0')
conflicts=('sdl-2.0')
options=('!libtool')
source=('hg+http://hg.libsdl.org/SDL')
md5sums=('SKIP')

pkgver() {
  cd "$startdir/SDL"
  hg tip --template "{rev}"
}

build() {
  cd "$srcdir/SDL"
  rm -rf build
  sh autogen.sh
  mkdir build && cd build
  ../configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/SDL/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
