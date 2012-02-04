# Maintainer: poplarch <poplarch[at]gmail[dot]com>

pkgname=twilc-git
pkgver=20120123
pkgrel=1
pkgdesc="twilc is a CLI(command line) twitter client based on NCurses Library."
arch=('i686' 'x86_64')
url="https://github.com/pipitu/twilc"
license=('GPL')
depends=('liboauth' 'libxml2' 'ncurses' 'curl' 'jansson')
makedepends=('git')
conflicts=('twilc')
provides=("twilc")

_gitroot="git://github.com/pipitu/twilc.git"
_gitname="twilc"

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

  if [[ -d $srcdir/$_gitname-build ]] ; then
    rm -rf $srcdir/$_gitname-build
  fi

  git clone $srcdir/$_gitname $srcdir/$_gitname-build

  cd $srcdir/$_gitname-build

  ./configure --prefix=/usr

  make
  make DESTDIR=$pkgdir install

  rm -rf $srcdir/$_gitname-build
}
