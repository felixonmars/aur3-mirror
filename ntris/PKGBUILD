# Maintainer: Tony Olagbaiye <frony0@gmail.com>
pkgname=ntris
pkgver=1.0.0
pkgrel=1
pkgdesc="A tetris game extended to n dimensions"
arch=('i686' 'x86_64')
url="https://github.com/frony0/ntris"
license=('GPL')
makedepends=('astyle')
depends=('freeglut' 'sdl_ttf' 'ttf-liberation')
source=()
md5sums=()

_gitroot=git://github.com/frony0/ntris.git
_gitname=master

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
  ./autogen.sh

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
