#Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=bashtrash
pkgver=20101105
pkgrel=1
pkgdesc="Freedesktop-complient trashcan implemented in bash script"
arch=('any')
url="https://github.com/robrwo/bashtrash/blob/master/trash"
license=('GPL')
makedepends=('git')

_gitroot="https://github.com/robrwo/bashtrash.git"
_gitname="bashtrash"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  
  install -D trash $pkgdir/usr/bin/trash
  
} 
