# Maintainer: Bernardo Barros <bernardobarros@gmail.com>

pkgname=lv2-stutter
pkgver=20110216
pkgrel=1
pkgdesc="An LV2 stuttering effect."
arch=('i686' 'x86_64')
url="https://github.com/jeremysalwen/Stutter-LV2"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2core')
makedepends=('git')

_gitroot="git://github.com/jeremysalwen/Stutter-LV2.git"
_gitname=$pkgname

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

  make
  make DESTDIR=$pkgdir install
} 
