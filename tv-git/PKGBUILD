# Maintainer: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>

pkgname=tv-git
pkgver=20110221
pkgrel=4
pkgdesc="tv script for mplayer and pinnacle310i"
arch=(any)
url="https://github.com/feanor12/TV"
license=('GPL')
depends=('mplayer')
makedepends=('git')

_gitroot="git://github.com/feanor12/TV.git"
_gitname="master"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  install -D tv $pkgdir/usr/bin/tv
}  
