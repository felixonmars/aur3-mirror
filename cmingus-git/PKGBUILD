# Maintainer: Kevin Whitaker <eyecreate at gmail dot com>

pkgname=cmingus-git
pkgver=20100307
pkgrel=1
pkgdesc="cmingus is a low priority implementation of the Python music library mingus in C and C++."
arch=('i686' 'x86_64')
url="http://github.com/bspaans/cmingus/"
license=('GPL')
depends=()
makedepends=("fluidsynth")
provides=("cmingus")
conflicts=("cmingus")

_gitroot="git://github.com/bspaans/cmingus.git"
_gitname="cmingus"
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
  msg "Patching.."
  sed '28i\#include <stdio.h>' $srcdir/$_gitname/src/mingus_container_tests.cpp > $srcdir/$_gitname/src/mingus_container_tests.cpp.new;mv $srcdir/$_gitname/src/mingus_container_tests.cpp.new $srcdir/$_gitname/src/mingus_container_tests.cpp
  msg "Starting make..."
  cd $srcdir/$_gitname
  export LIBS="-lm"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
 