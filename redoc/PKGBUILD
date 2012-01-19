# Maintainer: Simon Klee <simon@simonklee.org>

pkgname=redoc
pkgver=20120119
pkgrel=2
pkgdesc="redoc - an interface to the Redis documentation"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
url="http://github.com/simonz05/redoc"
provides=('redoc')
#depends=('go')

_gitroot="git://github.com/simonz05/redoc.git"
_gitname="redoc-git"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."

  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  make
  make DESTDIR=$pkgdir install

  rm -rf $srcdir/$_gitname-build
}
