# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=colourpipe-git
pkgver=20130411
pkgrel=1
pkgdesc="Collection of programs used to colour the output of other programs"
arch=('any')
url="https://github.com/maandree/colourpipe"
license=('GPL3')
depends=('java-runtime')
makedepends=('git' 'java-environment')
provides=('colourpipe')
conflicts=('colourpipe')

_gitroot=https://github.com/maandree/colourpipe.git
_gitname=colourpipe

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  MAKEFLAGS= make DESTDIR="$pkgdir/"
}

package() {
  cd "$srcdir/$_gitname-build"
  MAKEFLAGS= make DESTDIR="$pkgdir/" install
}
