#Maintainer: _@killown.com

pkgname=xcwd
pkgver=1
pkgrel=1
pkgdesc="xcwd is a simple tool which print the current working directory of the currently focused window."
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
url="git://github.com/schischi-a/xcwd.git"

_gitroot="https://github.com/schischi-a/xcwd"
_gitname="xcwd"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."

  mv $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build
  
  sudo make DESTDIR=$pkgdir install
  rm -rf $srcdir/$_gitname-build
} 
