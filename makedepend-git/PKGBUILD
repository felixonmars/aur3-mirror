# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
pkgname=makedepend-git
pkgver=20100918
pkgrel=1
pkgdesc="The X.org dependency generator"
license=('X11')
arch=('i686' 'x86_64')
url="http://freedesktop.org"
makedepends=('git' 'xorg-util-macros')
_gitroot=git://git.freedesktop.org/git/xorg/util/makedepend
_gitname=makedepend

build() {
  cd $startdir/src
  
  msg "Getting source from git..."
  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot
  fi
  
  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build

  msg "Running autogen..."
  ./autogen.sh
  
  msg "Building..."
  make
  install -D -m0755 makedepend "$pkgdir/usr/bin/makedepend"

  msg "Cleaning up..."
  rm -rf $startdir/src/$_gitname-build
}
