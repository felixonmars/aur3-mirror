# Maintainer Johannes Sjolund <j.sjolund@gmail.com>
pkgname=python3-pylzma-git
pkgver=20120422
pkgrel=1
pkgdesc="Python bindings for the LZMA compression library. Experimental python 3 support."
arch=('i686' 'x86_64')
url="https://github.com/fancycode/pylzma"
license=('GPL')
depends=('python')
makedepends=('git')

_gitroot="git://github.com/fancycode/pylzma.git"
_gitname="pylzma"

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

  python setup.py install --root=$startdir/pkg
}
