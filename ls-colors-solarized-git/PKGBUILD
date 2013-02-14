# Maintainer: Isaac Aggrey <isaac.aggrey@gmail.com>
pkgname=ls-colors-solarized-git
pkgver=20130213
pkgrel=1
pkgdesc="Solarized colors for ls/dircolors"
arch=('any')
url="https://github.com/sigurdga/ls-colors-solarized"
license=('unknown')
groups=()
makedepends=('git')

_gitroot=git://github.com/sigurdga/ls-colors-solarized.git
_gitname=ls-colors-solarized

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
  eval `dircolors ~/.dir_colors`
}
