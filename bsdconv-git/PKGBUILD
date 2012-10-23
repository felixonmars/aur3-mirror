# Maintainer: PkmX <pkmx.tw@gmail.com>
pkgname=bsdconv-git
pkgver=20121023
pkgrel=1
pkgdesc="BSD licensed charset/encoding converter library with more functionalities than libiconv"
arch=('i686' 'x86_64')
url="https://github.com/buganini/bsdconv"
license=('BSD')
makedepends=('git')
provides=('bsdconv')
conflicts=('bsdconv')
_gitroot='git://github.com/buganini/bsdconv.git'
_gitname='bsdconv'

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

  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_gitname-build"
  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
