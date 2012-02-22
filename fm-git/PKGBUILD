# Maintainer: Andreas Hübner <andreas@k4n.de>
pkgname=fm-git
pkgver=20120222
pkgrel=1
pkgdesc="Fast Move: minimalistic ncurses file system viewer"
arch=('i686' 'x86_64')
url="http://github.com/jimenezrick/fast-move"
license=('GPL3')
depends=('glib2' 'ncurses')
makedepends=('git')
provides=('fm')
conflicts=('fm')

_gitroot="git://github.com/jimenezrick/fast-move.git"
_gitname="fm"

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

  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"

  # Makefile install will rename the binary if dir does not exist
  mkdir -p "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
