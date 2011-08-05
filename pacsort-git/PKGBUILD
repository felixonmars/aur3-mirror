# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=pacsort-git
pkgver=20110805
pkgrel=1
pkgdesc="Simple sorting implementing alpm's vercmp"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/pacsort"
license=('GPL')
depends=('pacman')
makedepends=('git')
provides=('pacsort')
conflicts=('pacsort')

_gitroot="git://github.com/falconindy/pacsort.git"
_gitname="pacsort"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
