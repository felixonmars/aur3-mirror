# Maintainer: Anton Shestakov <engored*ya.ru>

pkgname=doom2d-rembo-hg
pkgver=64
pkgrel=1
pkgdesc='a Linux port of Doom2D game, free DOS two-dimensional arcade created by Russian video game company "Prikol Software" in early 1996 being impressed by original DOOM game by id Software.'
arch=(i686 x86_64)
url='http://code.google.com/p/doom2d-rembo/'
license=('GPL')
depends=('sdl' 'sdl_mixer')
makedepends=('cmake' 'mercurial')
provides=(doom2d-rembo)
conflicts=(doom2d-rembo)

_hgroot='https://code.google.com/p'
_hgrepo='doom2d-rembo'

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  cmake src
  make
}

package() {
  cd "$srcdir/$_hgrepo-build"
  
  install -D -m755 "doom2d" "$pkgdir/usr/bin/doom2d"
  install -m755 -d "$pkgdir/usr/share/doom2d-rembo/"
  install -m644 -t "$pkgdir/usr/share/doom2d-rembo/" src/*.wad
  install -m644 -t "$pkgdir/usr/share/doom2d-rembo/" src/default.cfg
  
  install -m755 -d "$pkgdir/usr/share/doom2d-rembo/music/"
  install -m644 -t "$pkgdir/usr/share/doom2d-rembo/music/" music/*
} 
