# Maintainer: tazzon<tazzon@freefr>
pkgname=selector-git
pkgver=20121204
pkgrel=1
pkgdesc="A simple command line utility for dynamic pattern selection"
arch=('i686' 'x86_64' 'armv6h')
url="http://fleuret.org/francois"
license=('GPL')
depends=('ncurses')
makedepends=('git') 
install=$pkgname.install
source=()

_gitroot='http://fleuret.org/git/selector/'
_gitname=$pkgname-$pkgver

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

  make selector
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

