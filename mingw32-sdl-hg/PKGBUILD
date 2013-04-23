# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
pkgname=mingw32-sdl-hg
pkgver=6808
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (hg, mingw32)"
arch=('any')
url="http://www.libsdl.org/"
license=('LGPL')
makedepends=('mercurial' 'mingw32-gcc' 'mingw32-w32api')
options=('!buildflags' '!strip')

_hgroot="http://hg.libsdl.org/SDL"
_hgrepo="SDL"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  cd "$srcdir/$_hgrepo"
  ./autogen.sh

  rm -rf "$srcdir/$_hgrepo-build"
  mkdir "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"
  "$srcdir/$_hgrepo/configure" \
	  --prefix=/usr/i486-mingw32 \
	  --host=i486-mingw32 \
	  --enable-static \
	  --enable-shared
  make
}
 
package() {
  cd "$srcdir/$_hgrepo-build"
  make DESTDIR="$pkgdir/" install
} 

# vim:set ts=2 sw=2 et:
